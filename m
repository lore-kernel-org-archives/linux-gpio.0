Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447301;
	b=fhadWoV6i78h4Ag5RZf0NIeD9Ckt1+h0WCnJ9okgA+WeuvggXaGI2yff0GiQxd43MTg0
	 nSE4CJxIjro++MakB+ilQYRF5Nojq/xqRjjVY7Q2H6kSrh5yUzif6pw/3jY/FUXMRq8il
	 kHJluGA2jHwmeOn+IV7BUEbgiWjCXCEjsPG+q/Tj/A9Bu8aTzkaDlD2rSo4yoAMJNPFmh
	 7L+CzEWdH5KqPKpU6yGTxP/mvY7poIr2e8qqpsMiUNBRje3A/F2XqiW3XkDZWa4YMy+Aq
	 lU7aKBaXxqvuF+r8TaWEEwMTmY28QKP7OJPgunkHoSZaDgD61qKy1XN7sJz65Bj+9IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=i9NMjvAfw7eusmnV0AZKfdwsVuRZv9qemPp30arLmJE=;
	b=gs1xpbcBr1g/IqU6thpgk7OjbrxJMYEG3yBcsVPrgOgWcewfOWugDT70/WY/Aa/P3xj4
	 Kf2WzKglM2aBh8X6qAlXtMAuK9qmpIZqynXKAackytRtrO7IOgNrMM6kUhjdi9GQMKQjl
	 Z5BBZaa7VA3rp3fvwrdOWyJDgl5FCOgXw2yhNEex5TXYx5kDLbTzIoIpLivVZeBhXYrNo
	 DanTqFvCbdhgmXpWHMtnoFtpEcFfEhMa+jrgoMMRbaq7cEUFjXk+YlwDePthpQHe0SPoG
	 k79y6zRvdeyWBxEWzsGQu7wgZNOhBlgvpH2H+jnONQNpDga202OzL0Am8XtJI9j/ZBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=p0n77Wx4;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E2A60A2626
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8E2A60A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=p0n77Wx4
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so5494613a12.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 07:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795447299; x=1796052099; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i9NMjvAfw7eusmnV0AZKfdwsVuRZv9qemPp30arLmJE=;
        b=p0n77Wx4SqlI35wj3vSW5/a4xAdd4wNUNkh6YbMnzBVQ54OiVYdXwuDS9gjnUHkZJO
         113Ix9RduNcBVNZhUsvmmaAQszrFfW10LvTEOpHUVO68WLndMwTMBR8QxmKc1q9/4HXl
         TYgwU3FMu2fAABoP7Ggd9CHuD3hEOlsymAC0F8NBRefLojQKEJqNrBa2etf2kwTwisFz
         042NXBX18mrhZ6KVHLQQTEKrIiFws5bdZrfumK2QmX5qqN3O+VHtMQW7uRaJ8QGZqb9B
         Sss/h2R8j1cWU9e0qjKAJoAIn7t1nww74JCdAIdkMTzlzZE/l6j4r8U61jNwpUWqsH6L
         dG9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447299; x=1796052099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i9NMjvAfw7eusmnV0AZKfdwsVuRZv9qemPp30arLmJE=;
        b=z6A52Se+a9qnxzjVHDR702zjrr3/Srjz8sup/EKplh4y4M2ese07Oa+/I0lBfCKrTf
         j6mWrqt1kJOSTWRLpiP5QSns+ac/m5HXL/pjhlxTcsYCQxhuc+ad139cpYVdwf5H/XlP
         scoWFxq7B+/ebn5vEUf1w7KmhyxoqtBlQ3c4WwwcDUXLzsSMqAXb7wLsSAtcFJ10mrG/
         zLNSOy9TZJG6K+SDWVp3Ns+HkzBum26XPD2pDwAKFFo+jAsrPhJeBP7KBDViuW6dNZWZ
         PSqoAlF+yOMX9AJXQ3MuihBGJp6ObEcWDwN9vjdHrorWuUQWU/eC+yIRSh6/b2fde442
         XkgQ==
X-Forwarded-Encrypted: i=1; AL+hErHACNk7I30CMB5dpCUclRThoZ6zKCx5Pml2PsFgA5vHd4uu+RTetyolvE7Jknmzq1bVBX74D/JrOs9c@vger.kernel.org
X-Gm-Message-State: APuU4Z9kEM0zHMTtEoOp4cS5udPS0EqCKnXqLi03qjGGaAlutPTRUbEX
	7ZdvATlPw0WjMRvka2dFr/sny+j8n7dTwPlyAvZMVsPkvAolzK06XLBrEkqshKq704Y=
X-Gm-Gg: AZFdTZdPycohVFIudVBOGChYvzKK9I2hXPZu2Jc2ym/Ng17A9C2u/uz67HzARTjyG6r
	blNmRfpIwMO5AQ18aZcEdbbocTiyx2zKKFfhky5yINGYEgrCKMoEHzAs/hpsmiPQ/FYqSIzFOUo
	cpN3UiHkN4Ab3YnHpc6/Dq47uzSNj2EEKAMJDdA39n6WvRk9/OsBSfcJ2I5yKS4BmiRi5J4Z6bG
	S0694MpiqtKmhltV4Z7fF0dBErnJlNgRgmheX16I/FvhuCdELXv3JxRHmTxJXJWWhgglAuIcxHI
	sJ7c2TLlLI/COgzTsMq0xIITdI5GFtThKtKfjkIokgWY6y0rar18Pu0Z60UgnIj9lrSafv5Zeu+
	jgYnXAwnH/5Wy98pDADGepFfNaI58ANOrQZ6E+6mH/lx0Pn9Bwum6mbxCBVmISnCahVWq8m37rI
	FGmtGP55oll7YktWCuT+TmbU32VIBBLXCYg/5XPbzdT76PCxQkVUPP9MPBq2QckiKYBPSee1xe0
	iWuUK79WPf5wB7VelZ1LKWGjnTZtGByJWEp42M6ZC7r87puFQWpvclGjzlbOyeWVAkLFf/ZpSCK
	+gzvtH9orqywsNKdPfdnvbjLjmyvS4BlAhr7OTWW33FuISRiIfM=
X-Received: by 2002:a05:6402:4004:b0:6b5:8719:6d51 with SMTP id 4fb4d7f45d1cf-6ba37e6f76amr9086912a12.32.1795447298876;
        Mon, 23 Nov 2026 07:21:38 -0800 (PST)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm22884229f8f.50.2026.11.23.07.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:21:38 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Mon, 23 Nov 2026 16:21:31 +0100
Subject: [PATCH v3 09/10] firmware: arm_scmi: add an operation to set the
 function of a single pin
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261123-clegoffic-pinctrl-scmi-gpio-v3-9-d61f039be008@baylibre.com>
References: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
In-Reply-To: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev

Add pin_mux_set, which selects a function on a single pin. mux_set only
works on groups.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/firmware/arm_scmi/pinctrl.c | 6 ++++++
 include/linux/scmi_protocol.h       | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
index 1bc4bca4c48f..4e3968fbc5ec 100644
--- a/drivers/firmware/arm_scmi/pinctrl.c
+++ b/drivers/firmware/arm_scmi/pinctrl.c
@@ -790,6 +790,11 @@ static int scmi_pinctrl_mux_set(const struct scmi_protocol_handle *ph,
 	return scmi_pinctrl_function_select(ph, group, GROUP_TYPE, selector);
 }
 
+static int scmi_pinctrl_pin_mux_set(const struct scmi_protocol_handle *ph, u32 selector, u32 pin)
+{
+	return scmi_pinctrl_function_select(ph, pin, PIN_TYPE, selector);
+}
+
 static int scmi_pinctrl_get_pin_info(const struct scmi_protocol_handle *ph,
 				     u32 selector)
 {
@@ -854,6 +859,7 @@ static const struct scmi_pinctrl_proto_ops pinctrl_proto_ops = {
 	.function_groups_get = scmi_pinctrl_function_groups_get,
 	.function_flags_get = scmi_pinctrl_function_flags_get,
 	.mux_set = scmi_pinctrl_mux_set,
+	.pin_mux_set = scmi_pinctrl_pin_mux_set,
 	.settings_get_one = scmi_pinctrl_settings_get_one,
 	.settings_get_all = scmi_pinctrl_settings_get_all,
 	.settings_conf = scmi_pinctrl_settings_conf,
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 072190e89064..5cea4ee14a3e 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -789,6 +789,7 @@ enum scmi_pinctrl_conf_type {
  * @function_flags_get: tells whether the specified function is pin-only and
  *	whether it is a GPIO function
  * @mux_set: set muxing function for groups of pins
+ * @pin_mux_set: set muxing function for a single pin
  * @settings_get_one: returns one configuration parameter for pin or group
  *	specified by config_type
  * @settings_get_all: returns all configuration parameters for pin or group
@@ -812,6 +813,7 @@ struct scmi_pinctrl_proto_ops {
 				  u32 selector, bool *pin_only, bool *gpio);
 	int (*mux_set)(const struct scmi_protocol_handle *ph, u32 selector,
 		       u32 group);
+	int (*pin_mux_set)(const struct scmi_protocol_handle *ph, u32 selector, u32 pin);
 	int (*settings_get_one)(const struct scmi_protocol_handle *ph,
 				u32 selector,
 				enum scmi_pinctrl_selector_type type,

-- 
2.56.1

