Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375927;
	b=1P1e2brEhcWHskL0ZwfvjwYXDKSqEGTY+Ji7aYCtXqdflsFtAGponurm/cnNF6MbHziI
	 a2XyzrkhVsHuFcRFbdkEscEBDURyN5SMBmOVQITa00kNmDERCiFlYcLg5ldOf43b7/kEr
	 WP6Zok5rPnq0txdMvUSTvvKfPL3Apz+ljDRXoB85LI8ThqozT1mEiduYm0Z1+LBfvsTBz
	 tWJLh2uOM7lXGSJcmlqoPXIdbe09uat0JQjiCr1immEGVvLTcWsn+PQaVb5lyVboTDluu
	 2OzgFBwlqvfKFIjuDjtOUc9zwurjfTnJflFvsAMjSdYxBSaoO3giE3a2gQmNCbS+/Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=j7BatgHj5ITP9IvPD8k1iBj2N7wXMOFQgCoh9MUEa7E=;
	b=DTANUJb4SFZy8vJLeiSi4wpbbbx9xC5PG3BPpPrGry6tydM5GbHNKdsdY6rV5GbQUCl/
	 lJlJMfWBLoRchhBTKGq7ldw8PAjZ/xjt/ZdCZ0jhMjvusNvjQT1ZDSMyV755+U+3J1Kgz
	 np2cBPbRVnyvlFEKiVF1cJwSPiHTDNV2r829gcvo9Lgdhs/RMG7w0z3r6zcWE1qA4uvSt
	 NsA5lTKCU8nH7zfF1+JeqCrEYs7r+bPSjpOeTMf366+e//hhPIAmRJ+Hxw9Q4Z7lWoIb1
	 TILq8WFxUoM1rsh4rbl/8ViVyXR1lKitJUQwqJ2a8fVU+KvcauLIu4rpk8uDq59lF1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=RvKXdaZt;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F58760A2615
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 15:58:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F58760A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=RvKXdaZt
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so4753295e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 08:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793375925; x=1793980725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j7BatgHj5ITP9IvPD8k1iBj2N7wXMOFQgCoh9MUEa7E=;
        b=RvKXdaZtJhcETgl8YlbAnDofeGmtAsB+7fotRSXMvp+ewDqiLebBIUsEVR+pn8VKE0
         6YJQjRpujfC2eeGVDS/RrI0ACEzIzK9QVkuiYQGaXwvVc4itSm5zafOlg6UsBYMp0XVa
         LUI1x6/dNrB6xAJ7j2uqxs+4cBDI9mfhD/6qc+S/rfvC0F/vyCEtgyCh45U3zjDQW9wJ
         BcN8xrEIcFZyrBXxwVqX1sgZa0tFpwnfEumbXDHrCnSv390gF6Qdf8razGfWLmSLZgn0
         lVZLcXDL6DzxNDaUBQb1DAf0xbXk1BRuoJ79+R+NW3PUxM0RufNmhgKHqY0beTQ/yPIy
         1yWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375925; x=1793980725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j7BatgHj5ITP9IvPD8k1iBj2N7wXMOFQgCoh9MUEa7E=;
        b=b6K/hZH2c85YIh5ySFFVBQjvSYtDVO0j8fAHS9GcAYjfbuu3pxl6FThDBoccw4iz9e
         YjS2s26cC+0ripyGeHAH9gwZPDImfeC8q1MFKjNbsO84H4Y2192YlIfpjcmLnJtMVxLn
         6d2I1EPH8lVUz9VQS5P2ih8pq3qJBpN555v0CJ/YoRpYe/JMsL04gjj24Vdv/NvQolLK
         L3ftTx44n/LYK8EkH1DJDlLWqradqHULE+mzhXCwYclOQzPFwYIKGYusf1TLnrXjEeOy
         BdJ4Fs52D2n/1mxn1Bq09tyLE2MFhCSufcMrRz9GUtkV1m3Ru35aKptrncbS48uRPGST
         OUNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxB+/8ruYnszczS4uQw+GrEjGAcb36ZSSD/nxzEVNVXCLnAFyi1+IJLpdwuy3pUdTzQmkUfFWC6/orZ@vger.kernel.org
X-Gm-Message-State: AFq9FYK9Q0mSWdnhPcylcyPrHuS9rYYDg5JlLzB4UwAwNXfWIYnnslii
	HMFaYmVbN/EzwjDTDbBpxhmV9VOut2XauPEujgIqYWKGdHYWdxLAPiZ1SWoJHpELLIg=
X-Gm-Gg: AYBFou3DsKxeYdmxIEVS+XKJck6sFmylmwVSqgV4+2TW4lIPcpV0uLwqn8wkLWRG+x/
	/ujlK1QNWfpFM69IF4uKUlzNrROqNHfb10FcRPNmgIomKTe77rS4juE3sxseb097NYXmhi/SLxu
	P1fK7RRctLq83LIl2MVUWH5rnoDqMUNOne+0STFpwS3fd8mjbpIcA04USev3oNaKa+1lduMqG4u
	Ykn9B2ZjRJW7pKWIWv8yx2oLp8muVkZB2wcQnaKNCf+0mhqUnep1SRdD3FYsv7iGEHqq1zzCgtN
	CqrR7X2Xl3BoeQ+586TQD0twJ4TRTa97rkSbZQWUck2PKjQEuKH4jT2YnaxfEPu/wVrJI5zlVE+
	Jr2KcDMuwP+/ETjFSxXZh+ahcSs0K8uNOJAvWKHNAiU98Lnum/m6eO0reEMwNtfDgoy1MkKoxxZ
	aQTtdNHEhDmopdYeKNiHkqtc/tK1tXu158KAH1qpwsYYHGi71HPG3+IZceY8JnvqaiuwaPKC/Re
	pokKOvfqybqLpMmZTDApCiF+j3htQc+MrhHZ1sRRiSKgpvJq7PpjG3gLTLNmCAEb1NG9qLwRWC7
	qctXhUQp57wOmxZvMUs0DXFCpO5GthersBbS4/ARrQNajtAbw7c/
X-Received: by 2002:a05:600d:a:b0:4ac:aae6:6400 with SMTP id 5b1f17b1804b1-4acaae665a6mr33076135e9.13.1793375924966;
        Fri, 30 Oct 2026 08:58:44 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04785sm146942255e9.4.2026.10.30.08.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:58:44 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 30 Oct 2026 16:58:42 +0100
Subject: [PATCH 11/11] pinctrl: scmi: select the GPIO function on GPIO
 requests
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
Message-Id: <20261030-clegoffic-pinctrl-scmi-gpio-v1-11-52d92843ad97@baylibre.com>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev

On a GPIO request, select the GPIO function of the pin, on the pin for a
pin-only function or on its single-pin group. Without a GPIO function the
mux is left as it is.

Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 64 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 6f44e8c0fee6..ba649304638e 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -74,6 +74,69 @@ static int pinctrl_scmi_free(struct pinctrl_dev *pctldev, unsigned int offset)
 	return pinctrl_ops->pin_free(pmx->ph, offset);
 }
 
+static int pinctrl_scmi_gpio_mux_set(struct scmi_pinctrl *pmx, unsigned int pin)
+{
+	const unsigned int *elems, *pins;
+	unsigned int nr_elems, nr_pins, i;
+	bool pin_only, gpio;
+	int nr_functions, func, ret;
+
+	nr_functions = pinctrl_ops->count_get(pmx->ph, FUNCTION_TYPE);
+	for (func = 0; func < nr_functions; func++) {
+		ret = pinctrl_ops->function_flags_get(pmx->ph, func, &pin_only,
+						      &gpio);
+		if (ret)
+			return ret;
+
+		if (!gpio)
+			continue;
+
+		ret = pinctrl_ops->function_groups_get(pmx->ph, func, &nr_elems,
+						       &elems);
+		if (ret)
+			return ret;
+
+		for (i = 0; i < nr_elems; i++) {
+			if (pin_only) {
+				if (elems[i] != pin)
+					continue;
+
+				return pinctrl_ops->pin_mux_set(pmx->ph, func,
+								pin);
+			}
+
+			ret = pinctrl_ops->group_pins_get(pmx->ph, elems[i],
+							  &pins, &nr_pins);
+			if (ret)
+				return ret;
+
+			if (nr_pins == 1 && pins[0] == pin)
+				return pinctrl_ops->mux_set(pmx->ph, func,
+							    elems[i]);
+		}
+	}
+
+	return 0;
+}
+
+static int pinctrl_scmi_gpio_request_enable(struct pinctrl_dev *pctldev,
+					    struct pinctrl_gpio_range *range,
+					    unsigned int offset)
+{
+	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
+	int ret;
+
+	ret = pinctrl_ops->pin_request(pmx->ph, offset);
+	if (ret)
+		return ret;
+
+	ret = pinctrl_scmi_gpio_mux_set(pmx, offset);
+	if (ret)
+		pinctrl_ops->pin_free(pmx->ph, offset);
+
+	return ret;
+}
+
 static const struct pinmux_ops pinctrl_scmi_pinmux_ops = {
 	.request = pinctrl_scmi_request,
 	.free = pinctrl_scmi_free,
@@ -82,6 +145,7 @@ static const struct pinmux_ops pinctrl_scmi_pinmux_ops = {
 	.get_function_groups = pinmux_generic_get_function_groups,
 	.function_is_gpio = pinmux_generic_function_is_gpio,
 	.set_mux = pinctrl_scmi_func_set_mux,
+	.gpio_request_enable = pinctrl_scmi_gpio_request_enable,
 };
 
 static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,

-- 
2.56.0

