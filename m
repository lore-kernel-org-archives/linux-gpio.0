Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793946627;
	b=n3V+I/Kl0JSFdq3gIncL2sxj3GZ4xwtrl1Lekr95KW/IkHWjWa7+i7tTco3re5oyDKCI
	 VLI9FgxcDFcANrtzdVtGb5KGIIODI9URg9NJlrcmBH+Lw6XFWZJvo/cOl5HBpKSKCGOP1
	 khmJYFbYH4b9JY5fyWkb6mpFCHLEl1knuwpPO2yEkCMfjeiNdeGO33UBNOOlJ5Oe1DQek
	 eDti391Sscm2NS8Q7dGYyXe7xxpZfQBfaoQKbBoDbUXtQAjAQ/QPtxRYGBV/TpN96hfow
	 Y76VuiUfnfh7mBgaDR3Uj/Q1fHBCN6MRLyIYpHOMdHapb0nSKwo1lq7SBgGznF1q2sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793946627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=PxwIyFKqtHC6susYGkQKKb2s602tPT5ccEUpS1x1IY8=;
	b=208G3L2+7RmsQGhwj8h8/Wi4D1LfbagZgnwcpRgKK1CIDNLvjUF1w6NW5nEote1VhZnP
	 kTCvG8Kd6pse4IGU1NUBMggVusDqtE+Yu10Fwi1zEwriMBNcHeaOGtI35BzFdCgwhbcLm
	 fYjSdMLMjNEG7DR85udV+NkN892JETHdcyQB1F6Rmmi6MTSfqcGaYCl49prBefE9NmlY6
	 Nqohd4Oth8o3SY68c6tzP/+94POBbxiPWYr3xldL1dTmXBXXgREQeZ1XRSR9muLJX2Sl8
	 CQdBiFga9nqybQrJIqJIYDNugnn/PXA6pW5Xh+yhmhwxviuTT2TE9kKiL5h2Mh2/9pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bqkp6u7P;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0DF606A32C
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 06:30:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA0DF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bqkp6u7P
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1ae18eb9b69so434689c88.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 22:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793946626; x=1794551426; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PxwIyFKqtHC6susYGkQKKb2s602tPT5ccEUpS1x1IY8=;
        b=Bqkp6u7PI85NUfsr8W9f4vScWFjm7+0YK7UDJ92/hO50CbV2aZTeRHLU3nxYJ0RuuS
         UEeukLwuOVVuDNXf6kb2ehgBh4OHHVxYRtyDDbV7BF57KaoytxPKjSVBDjVy+tFFhgft
         17Wp+jUqSNCLXYF3TU8/we/af2Dlll92wX2SKzo4GmvJ70xRGwo8rNCLNiXBM3kQ8VDK
         9XAZ1yLKdkbl1kgsggkoP1jUc952bi+YhvpdP87VlzTFRMKMavq977OEBBC0Hq+1d/FU
         2IHPK0NJD9HOV53w4HAZjKAvWW8CgJEoZnLxhuoe9YOqFJzYT4trlYcUioqGiptUMVoz
         02tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793946626; x=1794551426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PxwIyFKqtHC6susYGkQKKb2s602tPT5ccEUpS1x1IY8=;
        b=WeRCMRoEMMEfT1H9vZRcmeGs1Co7Qv0rKRconm4mxUrtlUrbK+MiqLRiIagscqde7g
         PahaeArnwD5JBOeNqxeXB+dt6nA+cyZt+x+nUkbZLI4mClRdSPwgyju6AGXcHdKxCL43
         jSvwK5Qc4K1C12nue2k5gHqbfiGJqlBEkO39sa8Ls44ca2/r53w3crTyqZqUgn0RopyU
         8ZCtaRwCXgrvPRZWouHMh2w6+dqnz3qpbFyIoRy98nF40c7izBbabP5HwL4Peeypx4WB
         Zg8KlNrai+D3QffHGxfLOEZzb+C4xgZ+nNyIZQICa6ta1q9ioxnTu9C/BQoMnEJ2NL8h
         SM0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzHrwycHrVCYZjwWb8cdEt2ofkZrwC3wsJOoH8VsRG6XZr8XvUae6KUaSdT0iU/G6qLJGJRzVwxAHC7@vger.kernel.org
X-Gm-Message-State: APuU4Z8ReyZloz9D8LnbHdbMYPH37A/8QBdKpJbfTgBAPqxRdF/eD/bQ
	DYEXrkWPfeS8plWRXOuT0qPjFXbWqOPJUa5Hsfzw1zjeXfOpKwAeop1N
X-Gm-Gg: AYBFou19uDnPNXqp9hVEEkhrToPWJvOu/QNWAeYsRgNxKZnmRuMLvWMNB7wPKLYVk0z
	IUx6o4NRCwaqTG/mIhBdot2IJKZrxgbDbQ7Aq09a5RFV/u8kxiiu9QstI+gxzInrCD1eXQYQVz1
	lv5X5bBuh4redEQk5LvDZ1nqw1sH2mljb/YS4oJPmm4Hbj0MbmI1kD5emcgj2QcDvuLTmvTp9RX
	TsBQUtOI0+UmntmbLRe3Oo9vnKaiDK1Lndiu5tk8SmsnK6Ga8rLSGweYotb11v9xtAh4+XH4/w/
	g6fsWHRVQW1JXwERcf6VXUhVGEv9q3pZFfjLKAlsAZwTdL02tsVnPygDMEkI+gUAw39wHLM3+9B
	kUi75OKCKMn04YSZS04E2xgilfhaXwmixz8U9ISRzAGwCSSuhrPqBXQ7r+XAKCOFys82T33FYaS
	4vxYGyOH2uSPBmxhTD4RmU4uDcU8or0n6wHU2W1Z5nMEHZFt0MIVTIMadwreYBp7SbvFcq2vms8
	KBn0JTVzd97iR1bJn/i+bwpQZYnE5Rib+fytv6tu/YdnH+bGd/91VgSZ37lueB2wdvpqR6W7ZC+
	Ic/1JptZfuu0aDQ5Emo3dLGARO5e3hSQ3LicP6jawCGn8RoXFlnN4C/uJkm/KJTToq4iNl8jNUg
	VzXMPurVo7RDVDOD7
X-Received: by 2002:a05:701b:280c:b0:143:2719:f800 with SMTP id a92af1059eb24-1b25d3560ecmr1624296c88.40.1793946625885;
        Thu, 05 Nov 2026 22:30:25 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:64e:8358:c9cb:c17b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4a63f6sm3734266c88.9.2026.11.05.22.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:30:25 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 05 Nov 2026 22:30:17 -0800
Subject: [PATCH v3 3/8] gpiolib: of: return -ENOENT from of_gpio_count()
 stub
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-b4-gpiolib-free-v3-3-bb47ad58642d@gmail.com>
References: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com>
In-Reply-To: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.17-dev-e56a4

gpiod_count() and its firmware backends are expected to return either a
positive number of GPIOs or a negative error code (-ENOENT) when no
GPIOs are assigned. However, the !CONFIG_OF_GPIO stub for
of_gpio_count() returns 0 instead of -ENOENT. This causes gpiod_count()
to skip the platform_gpio_count() fallback (which triggers when
count < 0) and erroneously return 0 to callers.

Change the stub to return -ENOENT to match the real of_gpio_count()
implementation and the other error-returning stubs in gpiolib-of.h.

Fixes: f626d6dfb709 ("gpio: of: Break out OF-only code")
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib-of.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-of.h b/drivers/gpio/gpiolib-of.h
index 218cfe5bc4ac..9ca540d93f93 100644
--- a/drivers/gpio/gpiolib-of.h
+++ b/drivers/gpio/gpiolib-of.h
@@ -46,7 +46,7 @@ static inline bool of_gpiochip_instance_match(struct gpio_chip *gc,
 static inline int of_gpio_count(const struct fwnode_handle *fwnode,
 				const char *con_id)
 {
-	return 0;
+	return -ENOENT;
 }
 static inline int of_gpiochip_get_lflags(struct gpio_chip *chip,
 					 struct fwnode_reference_args *gpiospec,

-- 
2.56.0.506.g506a7eabc5-goog

