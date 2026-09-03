Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09334DF4C7;
	Thu,  3 Sep 2026 15:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788450950; cv=none; b=RsT68snG/LrLPyrFRNMC7A+tQIoStJ8/mJmczew+PT4A3xQTYkWA6aaxHNvJiPr95jduzG97y3vAXv7cMGh2WVfpCBMXj8ag+VuJkWdtw8s4E4qRWkMLyRx3SMAOLjbWvkq/irtyOwndXx2cbBZoslWeT21i+GScHq2+f4Zky7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788450950; c=relaxed/simple;
	bh=LgeelbVKSm5sk7+lSiVeSDJzQG9WZu9cPjkOzcdgPZc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mXVerCuzQ0OT9dSrJopIBkWdw+tP8dxazVVsPwhRdRbjmA+GxnhyzPOXfYVNB9o4NGCMnnOtNvLpDulSZaJFAjFwkIWP1a5aVnJ8TfH/dQA5Tp/wbBzy44NUfD4KmcItffJJQoVsMTsTxtySoxXsxcvtmVjG/j2IPhz4LIJeAfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=XrLmbpg+; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=aI1URO8r; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="XrLmbpg+";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="aI1URO8r"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4hbPMK0J5LzKvv6;
	Thu, 03 Sep 2026 17:55:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788450941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gqMbHiSzzKPHp90VgyMlKPKExPNihmb7zR3T0IjUqH8=;
	b=XrLmbpg+OwSfV259lA0s0Qo+MRFJfCCNc08Rm2EGOxyS519OUtYJ3P0iC7Qgp2ZVCFBUOk
	V6FMoxf9HhOCtBMFHDSnsKMkdykYjTm3m68JPS34SOOoI0P2zdFeZgRKuS7EoAgffy1OFZ
	uZ1Ss/3dSGdHgWt+TVITw/x9GO5FGWE7ZtgaPdO2uC+5DGWwIq/S6KtTSbhjEK2p49JH7r
	0n5eKS8cCXdUVgkIvxrMdWnW5OKud28EGFXGfaRv22w6CCmGyAmcg+oG9ndLDwZ2y9PeAq
	fug0mfEHzZEp1zB2CROC3s8RestrLYqp8UcDDJLdkrrc+mbkeUeBL+9M5jDr0A==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=aI1URO8r;
	spf=pass (outgoing_mbo_mout: domain of manuelebnerli@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=manuelebnerli@mailbox.org
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788450939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gqMbHiSzzKPHp90VgyMlKPKExPNihmb7zR3T0IjUqH8=;
	b=aI1URO8rH9YQHQjVLsBxeplmzB9N6YtJLhQQ3blxXs5PoYH/ABCW7i1g7N4fnvSCLrVyRs
	bGTsWwbJzWOXJpgdHgL7XOoRuAxNkXYk8CW5AfSwWiIET32AecaDpJc+vcD6yywbuzo59e
	hBtCnOtHNGivjBZlFQll9HJsgcFaSJs4Rmblqy5MtwxvJ7pSbkv1MCxesAr1Rr4V/aGjgQ
	ZrxdOM6kRV7lqKQvWbjCDHI64T3ELGHO8i01gai6lVocBRr/OpaRGE0KsZOONwHfDeMfHZ
	6/V/qrCZ3vOlRoxRwCYI+cnPJJXi+WjDzo8Qx/kwdXahtAoa92A3lkK4mggf8g==
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: gpio: Fix bracket
Date: Thu,  3 Sep 2026 17:53:44 +0200
Message-ID: <20260903155345.733244-2-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: k55dxrp9mzpghfmeotqox7aegew16sxq
X-MBO-RS-ID: 0fe043b500e8bc56f5e
X-Rspamd-Queue-Id: 4hbPMK0J5LzKvv6

Balance parentheses.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
 Documentation/driver-api/gpio/board.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/gpio/board.rst b/Documentation/driver-api/gpio/board.rst
index 4ac1e12cf..83b74843e 100644
--- a/Documentation/driver-api/gpio/board.rst
+++ b/Documentation/driver-api/gpio/board.rst
@@ -55,7 +55,7 @@ looked up by the gpiod functions internally) used in the device tree. With above
 
 Internally, the GPIO subsystem prefixes the GPIO suffix ("gpios" or "gpio")
 with the string passed in con_id to get the resulting string
-(``snprintf(... "%s-%s", con_id, gpio_suffixes[]``).
+(``snprintf(... "%s-%s", con_id, gpio_suffixes[])``).
 
 ACPI
 ----
-- 
2.54.0

