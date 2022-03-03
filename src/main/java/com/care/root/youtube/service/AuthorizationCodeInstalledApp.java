/*
 * Copyright (c) 2012 Google Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License. You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software distributed under the License
 * is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
 * or implied. See the License for the specific language governing permissions and limitations under
 * the License.
 */

package com.care.root.youtube.service;

import com.google.api.client.auth.oauth2.AuthorizationCodeFlow;
import com.google.api.client.auth.oauth2.AuthorizationCodeRequestUrl;
import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.auth.oauth2.TokenResponse;
import com.google.api.client.extensions.java6.auth.oauth2.VerificationCodeReceiver;
import com.google.api.client.util.Preconditions;
import com.sun.mail.iap.Response;

import java.awt.Desktop;
import java.awt.Desktop.Action;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;
import javax.servlet.http.HttpServletResponse;

/**
 * OAuth 2.0 authorization code flow for an installed Java application that
 * persists end-user credentials.
 *
 * <p>
 * Implementation is thread-safe.
 *
 * @since 1.11
 * @author Yaniv Inbar
 * @author Philipp Hanslovsky
 */
public class AuthorizationCodeInstalledApp {

	/** Helper interface to allow caller to browse. */
	public static interface Browser {
		/**
		 * @param url url to browse
		 * @throws IOException
		 */
		public void browse(String url, HttpServletResponse response) throws IOException;
	}

	/**
	 * Default browser that just delegates to
	 * {@link AuthorizationCodeInstalledApp#browse(String)}.
	 */
	public static class DefaultBrowser implements Browser {

		@Override
		public void browse(String url, HttpServletResponse response) throws IOException {
			AuthorizationCodeInstalledApp.browse(url, response);
		}
	}

	/** Authorization code flow. */
	private final AuthorizationCodeFlow flow;

	/** Verification code receiver. */
	private final VerificationCodeReceiver receiver;

	private static final Logger LOGGER = Logger.getLogger(AuthorizationCodeInstalledApp.class.getName());

	private final Browser browser;

	/**
	 * @param flow     authorization code flow
	 * @param receiver verification code receiver
	 */
	public AuthorizationCodeInstalledApp(AuthorizationCodeFlow flow, VerificationCodeReceiver receiver,
			HttpServletResponse response) {
		this(flow, receiver, response, new DefaultBrowser());
	}

	/**
	 * @param flow     authorization code flow
	 * @param receiver verification code receiver
	 */
	public AuthorizationCodeInstalledApp(AuthorizationCodeFlow flow, VerificationCodeReceiver receiver,
			HttpServletResponse response, Browser browser) {
		this.flow = Preconditions.checkNotNull(flow);
		this.receiver = Preconditions.checkNotNull(receiver);
		this.browser = browser;
	}

	/**
	 * Authorizes the installed application to access user's protected data.
	 *
	 * @param userId user ID or {@code null} if not using a persisted credential
	 *               store
	 * @return credential
	 */
	public Credential authorize(String userId, HttpServletResponse res) throws IOException {
		try {
			Credential credential = flow.loadCredential(userId);
			if (credential != null && (credential.getRefreshToken() != null || credential.getExpiresInSeconds() == null
					|| credential.getExpiresInSeconds() > 60)) {
				return credential;
			}
			// open in browser
			String redirectUri = receiver.getRedirectUri();
			AuthorizationCodeRequestUrl authorizationUrl = flow.newAuthorizationUrl().setRedirectUri(redirectUri);
			onAuthorization(authorizationUrl, res);
			// receive authorization code and exchange it for an access token
			String code = receiver.waitForCode();
			TokenResponse response = flow.newTokenRequest(code).setRedirectUri(redirectUri).execute();
			// store credential and return it
			return flow.createAndStoreCredential(response, userId);
		} finally {
			receiver.stop();
		}
	}

	/**
	 * Handles user authorization by redirecting to the OAuth 2.0 authorization
	 * server.
	 *
	 * <p>
	 * Default implementation is to call {@code browse(authorizationUrl.build())}.
	 * Subclasses may override to provide optional parameters such as the
	 * recommended state parameter. Sample implementation:
	 *
	 * <pre>
	 * &#64;Override
	 * protected void onAuthorization(AuthorizationCodeRequestUrl authorizationUrl) throws IOException {
	 * 	authorizationUrl.setState("xyz");
	 * 	super.onAuthorization(authorizationUrl);
	 * }
	 * </pre>
	 *
	 * @param authorizationUrl authorization URL
	 * @throws IOException I/O exception
	 */
	protected void onAuthorization(AuthorizationCodeRequestUrl authorizationUrl, HttpServletResponse response)
			throws IOException {
		String url = authorizationUrl.build();
		Preconditions.checkNotNull(url);
		browser.browse(url, response);
	}

	/**
	 * Open a browser at the given URL using {@link Desktop} if available, or
	 * alternatively output the URL to {@link System#out} for command-line
	 * applications.
	 *
	 * @param url URL to browse
	 * @throws IOException
	 */
	public static void browse(String url, HttpServletResponse response) throws IOException {
		Preconditions.checkNotNull(url);
		// Ask user to open in their browser using copy-paste
		System.out.println("Please open the following address in your browser:");
		System.out.println("  " + url);
		
		/*ScriptEngine engine = new ScriptEngineManager().getEngineByName("JavaScript");
		
		try {
			engine.eval("<script>window.open(\"https://www.naver.com\",\"Oauth2.0_Page\" \"width=400px, height=300px, top=50px\");</script>");
		} catch (ScriptException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
	}

	/** Returns the authorization code flow. */
	public final AuthorizationCodeFlow getFlow() {
		return flow;
	}

	/** Returns the verification code receiver. */
	public final VerificationCodeReceiver getReceiver() {
		return receiver;
	}
}
