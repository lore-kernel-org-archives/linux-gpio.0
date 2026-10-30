Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375926;
	b=tXlj/j4glxHMsE1nNFjBJRWrKJh7lpZZkqV6F1ZzjGLGjeCIZdpIC0rlgz/yi0ph9+Ye
	 qS30udN26SdNd+2THGPlllKiD6CPGaPCvZVpZ+jYJudOm/RD+zoZM718SrM4XXQiIHilL
	 NNfVyyy6JhQ9T7931Mah6prUiTYeOHjMBLtVkn0F5qg5E1fWvlAQAOqICTILvJGKUP89G
	 uPBHqDuIPEDpBwM9FHhzqtVhJmDwGU6CS9huBRS4pERG/lplNesiH1yYlaDeC81TR7NoT
	 vLr8iyleeSe4cFT5+wVxzqNU2BvzD36/pIH2in91R8MieNsZqpR77TOn782qcik5mvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=iNgD5dDfgPDT5bFFafHZDdSF81BbBx1RVfIsIKbMhFo=;
	b=rfG55vHiC1SRzJxUz5fwwyLgnet84q7BdXNjc5Ti3415eA8doucqrJhCLSlvu68oCS+d
	 NWQeNqD/60HHuanZtrjzdCJCny9b9vCYjP/7YkqMsbSeDmg7KuZ8n+CXbvSu/hdcdQpMn
	 aMAAVcbUqikALxt/4b+5gfQBQizAEUjz/totuPgMDOTCNSVQEU9XVW16MQK6W+EYIGp76
	 k0DRmz1H6BYOq6cYURndLFvLMyaRXY3wiPb3pLpXg0kKPWPVrHshh7illJn8CIg5iTxka
	 OUICTZEY4OZTVD5ToBWdKsADeI6PGg+GrwuEH+WwaX5ohrF/lgNFYxuTVl4B+ML0aCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nhujKAJU;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44DE606A33E
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 15:58:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A44DE606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nhujKAJU
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so8418195e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 08:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793375924; x=1793980724; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iNgD5dDfgPDT5bFFafHZDdSF81BbBx1RVfIsIKbMhFo=;
        b=nhujKAJUd9ZyaEMb/3IDj9ohGZfv1qgvEgVKDLOcRuSI8EgeyUCcg8F8ZijcIQ84H6
         9A2KBwJiDG8GcQdgxP9vfkR6j5B72t+p5ka6WDSzboVq7J2RUBbn26EyF0NoR7f5Xc93
         N+BzNKQXHgKag/oqDq9C5TjUV9K9ReGtrHFvR+wKAjo7QjkIZVs6vMeE9PEzAHw4CMzh
         fHdK6x5ozGKwxJiRGfjdpBjMu8ZRrZf2Jv7lUA2YIjvnjG/Z/j8fIugQ5yLGBE/U/Mcz
         5h/10QjaSwWwPuK5jbvQfRr8AnPpfe2Dp1/lbQy9oWbr3B3ErqLVI9C6gnczlTt8WxIO
         1ooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375924; x=1793980724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iNgD5dDfgPDT5bFFafHZDdSF81BbBx1RVfIsIKbMhFo=;
        b=wGAPmL0r0YfE2lrGnIuID3Huamzthxm13FrlPqgQprX/bpnbPdLi09Mz5vN7LBv/ei
         aqkutzUyXFke3WSINno3gBIO2+CmG4JmrdiGBzalo6ZmnKRVnQPQY7ddGkztHJ0hadPJ
         4/ooBYlsW8z6ALpJqLvlsxV96uTe8xhW5mWyfKvQ9JHpOI6hNVTmOaN6A4ZNjjsAZC88
         sLlnogJ1r7e1eY0MnUDY6Ra6TxKKYA7YHBMeaNQT8JK741EetpMLwEn0uN66IIrYHXTw
         Z0mhy/NBnibNwbAdOmfYkEo7GHq+KQYw+ceBALFixzWCimj3hGjPumrNaCHGImet6Zpf
         l2/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwkftgvfB9WpJUm6tgAikUfOIC9ffl5FBEPsdfNTlPAHJk4sgUIObMiFEhJdcXn353P/FjUitWgNGGn@vger.kernel.org
X-Gm-Message-State: AFq9FYKyc+jPG6yEeP3N3VlJTBJFtvhg//27gm9dcyDCgNOC9bDBo7Rg
	otEgTK43eK9dFhdxJsrJ87u49Sj83EShLFwADaeMVId5V60eqqBRkfwfIyKprOO/lW0=
X-Gm-Gg: AYBFou0OBnbCYAobjaZlIEWzbyO2yO4yw3m6lgGEKFja6NzBksjQYxhtw6lHoNyQenh
	/7zNIBjADVuyIfu9q0nKvXpTYRHo4r5vLuUFsuy1/zu34Fk4jHxB0zKun/nqqKIxckGvzIh52CT
	MWa7H2GRYbmxjuF2GeqvYuypDopoZVqbnuMremnsyXLeXiVTKLrF/Rp6pk+pkvVrhff55oRhT6B
	AeTB058CwOWa2Vf0AZ2esYlZSGqe63ltlCSccxxgFxbYrOYoTqTzzqVbb+9A+8qIja0+8qPQUhF
	HnTopPDinRsr8Yp+8+kl6PSJUjg9QAfaTX+8+vRMP/rc5d8O1W1aXfK+d24Pekqc/x8I8nEHTKi
	dJUOBzhNDHutl5pN2nvqWD2HbZ7NTiz51SC6Eb/VJHW0TBa99nLr9ZarJ25LNaGkaE5TOlBKDPR
	8dpPuIVcJ7f/h1Sev8CsDoS2ZGaAydTC8ayiiJhq1kjKFUbJbpCgYvGnUQKuxcJAGPdV8ar6nDL
	W4UK3jxjLl+WSQQ/NAIY+I6xkiDUh7ygEl/0Yq9NzvlmChiXIHhRAKZLihZbLHq565N/oI/Jf8c
	hjbB8DwLv2Atzw27jyIsODT5H8dyDqomT2uYuPODcEKppfVPf6A=
X-Received: by 2002:a05:600c:1909:b0:4a5:26b8:4507 with SMTP id 5b1f17b1804b1-4ac18b7dff9mr59814015e9.21.1793375924225;
        Fri, 30 Oct 2026 08:58:44 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04723sm165850995e9.5.2026.10.30.08.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:58:43 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 30 Oct 2026 16:58:41 +0100
Subject: [PATCH 10/11] firmware: arm_scmi: add an operation to set the
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
Message-Id: <20261030-clegoffic-pinctrl-scmi-gpio-v1-10-52d92843ad97@baylibre.com>
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

Add pin_mux_set, which selects a function on a single pin. mux_set only
works on groups.

Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/firmware/arm_scmi/pinctrl.c | 7 +++++++
 include/linux/scmi_protocol.h       | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
index ba602242754c..27b9a38ede74 100644
--- a/drivers/firmware/arm_scmi/pinctrl.c
+++ b/drivers/firmware/arm_scmi/pinctrl.c
@@ -802,6 +802,12 @@ static int scmi_pinctrl_mux_set(const struct scmi_protocol_handle *ph,
 	return scmi_pinctrl_function_select(ph, group, GROUP_TYPE, selector);
 }
 
+static int scmi_pinctrl_pin_mux_set(const struct scmi_protocol_handle *ph,
+				    u32 selector, u32 pin)
+{
+	return scmi_pinctrl_function_select(ph, pin, PIN_TYPE, selector);
+}
+
 static int scmi_pinctrl_get_pin_info(const struct scmi_protocol_handle *ph,
 				     u32 selector)
 {
@@ -867,6 +873,7 @@ static const struct scmi_pinctrl_proto_ops pinctrl_proto_ops = {
 	.function_groups_get = scmi_pinctrl_function_groups_get,
 	.function_flags_get = scmi_pinctrl_function_flags_get,
 	.mux_set = scmi_pinctrl_mux_set,
+	.pin_mux_set = scmi_pinctrl_pin_mux_set,
 	.settings_get_one = scmi_pinctrl_settings_get_one,
 	.settings_get_all = scmi_pinctrl_settings_get_all,
 	.settings_conf = scmi_pinctrl_settings_conf,
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 072190e89064..736d34968f42 100644
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
@@ -812,6 +813,8 @@ struct scmi_pinctrl_proto_ops {
 				  u32 selector, bool *pin_only, bool *gpio);
 	int (*mux_set)(const struct scmi_protocol_handle *ph, u32 selector,
 		       u32 group);
+	int (*pin_mux_set)(const struct scmi_protocol_handle *ph, u32 selector,
+			   u32 pin);
 	int (*settings_get_one)(const struct scmi_protocol_handle *ph,
 				u32 selector,
 				enum scmi_pinctrl_selector_type type,

-- 
2.56.0

