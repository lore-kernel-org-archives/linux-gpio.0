Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8DC3CF962
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 22:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787869566; cv=none; b=E+rmn4+9wEJDGM7bHAG13AtDSb6z23rlYelQBKjg8VT0FdqtI7YMram3/yiXmEEQWQYN+cVdRDYMaGwDK6Lthz8qFKMTPBwu5eUhRuF95GovMjXW8Vy19CotOlEz8TyPaYummrhcd6TyvlwtykSVtcVNvyzI5drWqhmLjHe0a4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787869566; c=relaxed/simple;
	bh=TxvaZ4zayK7a2B63L4t8D8MbZm8/BwjOSwYLxeyM8RU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V7sc2nOB0/gPyVTmdyI6Ac8gx8XlGyCe+P84rzGU5HVYRdIt4Be5B+D8ki3frZ83GKsPz/dmtYc51qCKc2c8aUNnm02ZQlrAEXvKzGq2wh3InzgYrRxiBZaSJ8ZhB3LWftlFAbj18gndl8CZ5g4DlyHTIUFt4c1F4mlDIRjwyPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IF5KNcA6; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IF5KNcA6"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so2157685e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 15:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787869559; x=1788474359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KrToZPBnqDhx/hwRhT5E5yIhfEGUpGAvOCdqzL7a7pQ=;
        b=IF5KNcA61mCdmQAodnOMCbggzzV5GrSxVQCEGQJCGP+SqnY/CbBiUNQpPohcXta6/K
         NJe2uIl9cAqkhldVJeP/RHrhRUn7yJKKMjLsSzx6+PUyVtYqxVPTOjVnksM7d+0IGS5N
         IOyTXSpEAjSHBLhgHkzxOKK4VpjTVLgm5rFiOo6d3Q/2pR5ckLDRn7RPbDRdf0QnPl40
         qUueiIgrMI2dGZREPRUnf/e0U85r4aBQ+P5obu1ijGNY2ipD6EV8sK0/Ag/aXn4IuANN
         3u7T3fs+tvg9It+W2/9VvHMwu1q3C4af4S5GFVgrQ/LQ2j4Npi+T1zwbe2IKpmj58hOY
         JfOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787869559; x=1788474359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KrToZPBnqDhx/hwRhT5E5yIhfEGUpGAvOCdqzL7a7pQ=;
        b=k+28USs0HQ3ECENakmI4Ytl4VH5STD7thy7UQbSm7LpJr2ezRuvuLHS821APa85x3K
         edgW2H4zRwtuhyhmIokgmgS6e9PzNohbd1cn22iL9/kiB3KnhS2pO9CfiLR9MIVwj/HO
         toWJoRqaC1mCroDaWNGi4MmCqe8ucdivavFCUZsGHAh1AajyphP7u85D4V2gHGxj52eM
         MUaJA9ZEFw2g0zLRGrut0S5GINZnc8nQSkuHiiUdtTkI6uaBK5DOR6Px7wa4hbG4pmHV
         hnevvdD+LbhF/MVqyvQjAYNrnIgBEcjluUONG7kehsKvpaMzkW4Ef/YfiToAX9Uq3tGy
         p5ZQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq8/QjkabyCxFlUQhcQaGG9GYUpyuBV8T4qJFbyvHRNS01At9Jao24XN/hPOXTlhb0wW8fXUmVR7rZt@vger.kernel.org
X-Gm-Message-State: AFuF++mw+ogtMDMHOh0hEsIYfbs+vm6MxChl1UDbrNFHGpThl7LAmfDk
	s5w1os3VOvzvIBoO4fw3g0PA7j/EVUR7IFTUT+GfzKRE6xFy8YX8w7OJ
X-Gm-Gg: AR+sD13UUggGcMo8Jdsb7dFLk7NMH+N+glpc1yMudr7n4m2sSvsjIuQ7JsVaPE1TSI0
	ubQ+jgjfuRgrv1zFkBebkh1kVds/ch1ywohlhfU7A7QqBLNAGpDy/SofX5VGNNleGlTU5r2vnDm
	aIre0e/W7+EqFMZo2rZWW7LdT2yNTM/yElU8a0ZBOFUM5Lt/1iph3Piyx00K/dfcF0d46UtN/im
	GlpN4rNNs+xQ45PdJ8aN8nrI3Xb+eWPbUKoaPz4dULcPPx0Z7xzZogeVJrRK25JZRSRpQ4fq0In
	bMdhDkbggsssCJNDFPlXZ6GaA3i1lUC9yyxOFkIq6LzoB6mw+f7u0SrEnpZNnSKtq1Yn4T9jT+R
	XXu/16axfHBA01MkZnrshZXxQMKkU1KmIkbsQWBUefi4Y/76GsSA0INuolGXAPhXuBjfgEYzSZV
	+cqu0sAinW4vzhavKPYevLC4iVbE9SsGeZoNxJsjcXQtwFw2OsH56O48epI4c=
X-Received: by 2002:a05:600c:698c:b0:499:adb5:e7b2 with SMTP id 5b1f17b1804b1-49b91c3ddc7mr38429415e9.11.1787869558933;
        Thu, 27 Aug 2026 15:25:58 -0700 (PDT)
Received: from m2.. ([37.142.156.156])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49b494228bfsm79722395e9.2.2026.08.27.15.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 15:25:58 -0700 (PDT)
From: Michael Zaidman <michael.zaidman@gmail.com>
To: lee@kernel.org
Cc: linusw@kernel.org,
	jikos@kernel.org,
	bentiss@kernel.org,
	brgl@kernel.org,
	linux-input@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/13] HID: ft260: add UART and GPIO support, plus I2C fixes
Date: Fri, 28 Aug 2026 01:25:50 +0300
Message-ID: <20260827222550.24634-1-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827205116.GJ2943942@google.com>
References: <20260827205116.GJ2943942@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 27 Aug 2026 at 21:51 +0100, Lee Jones wrote:
> That's precisely what MFD is.  It's one chip, usually with a shared and
> overlapping register spaces, that conducts multiple functions.  This is
> no different to any other single-chip device or SoC.
>
> Shoving everything into a single driver isn't how things are done in
> Linux.  This should be divided up into the associated sub-systems where
> each part can be reviewed and looked after by the appropriate SMEs.

Understood, and I am not going to argue MFD scope with you. But this
is not specific to my series, so I would rather not decide it here on
my own.

drivers/hid already registers other subsystems' devices from a
hid_driver: hid-cp2112 adds an i2c_adapter and a gpiochip, hid-mcp2221
adds an i2c_adapter, a gpiochip and an IIO device, and hid-ft260 has
hosted the I2C adapter since v5.13, commit 6a82582d9fa4 ("HID: ft260:
add usb hid to i2c host bridge driver").

So the split you are asking for is not a change to this series. It
means moving code that has been in drivers/hid since v5.13 into an MFD
parent with cells, and the same reasoning would apply to cp2112 and
mcp2221. I am willing to discuss that as its own conversion, but it
needs the HID maintainers to agree on the direction first, and I do
not think the UART and GPIO support should wait behind it.

It would also spread the driver over four trees, so a fix touching the
shared chip state becomes a cross-tree series with coordinated merges
between four maintainers - a cost the single driver does not have.

Jiri, Benjamin - this is your call. Do you want FT260 functionality to
keep growing inside hid-ft260, as cp2112 and mcp2221 do today, or do
you want a drivers/hid to MFD conversion for this class of USB HID
bridge chips?

Thanks,
Michael
