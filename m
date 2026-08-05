Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CB03DA7F9
	for <linux-gpio@vger.kernel.org>; Wed,  5 Aug 2026 05:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785909340; cv=none; b=eNa1JqaUEkd71pe1s1PYyOhxsIczQ6wm7k6FHW5EXt5FVxKOBPIZjuBFWHU3+lGcWpxhZjDLZbD/XLJmWyREGd6U/z1+191zy1G/S80empmenso8kbWeJyKWURrkzyQxpady+6PJ/BGtrh8lPUtretJXJAPP0d/cle4hHDdnE+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785909340; c=relaxed/simple;
	bh=YndnRnIJzNP08VGoOkCcRoa2iLM6zllhm8/C1C7xUwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cpt8hszb5pkXAd0bloXL3bWEaSfUX0xzQ9Zgz0XBXLLw+xjOw25c3MTiOufq23BZNFB/G3M/JCXZfZn26kXZFlmYLqo5ixoXzXsnVMfG9o4aiTj4DqqKq+sBU/LbPuae934DSMRHcH5Uj+2i9ldid9zcPEkjIMfYO1tMWiRqIHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NOl6v2wS; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NOl6v2wS"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so574559a91.0
        for <linux-gpio@vger.kernel.org>; Tue, 04 Aug 2026 22:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785909335; x=1786514135; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fOIdjOr1d4mgFF8hvqH6IkNCcqLGziDH/BcL0uvYe64=;
        b=NOl6v2wSZ8I86nEKXT9/9iI4eLXMbHM7f9ljI8oVqzszlGX7OQfFAHBQq3DU5ingyN
         vhd3702BH6BU7Uo1t2SYb+h+y/fHm8ApJE1GoiZMCooHK2QOJvDqfH/qPiuXVRSWSWIB
         HMi+kiQDSpq84feSAVbGmj4dbgd9ez5nZnr7dle7pLlYMEZ5QqBmi/N/YA0XDKZ5rkg/
         zJ6U9wb6hEoTk4sH6aQTCH7piIW0xzPJwuVsW2uPA6qNWUlK0xCtf/EczynMWR7ENhWP
         S/l1Nvwbp0yZxTq3Q4unLMdTsGNtT1WqjEagO07NuBczMhat+O6b61EbXQDjx5Nu7dwE
         AjPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785909335; x=1786514135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fOIdjOr1d4mgFF8hvqH6IkNCcqLGziDH/BcL0uvYe64=;
        b=c2JlItQnbxvMKmC0fgwX9RCxrStzwbuX9MeVu3Q/pftWwvvoKAsOnGXeAVP79FrMPC
         uk3jvPhxzyYjcX7FRqESshV4BRK8IeZggTurbvWL0FpBiQIT6MxHFUWXXQFUHAjqLdh3
         hMVISX1ve5kADDb4+Tzqmi20ytKa3lGIToUDIu0J/3iWZXRA/9TQXyhBvCav8W+Q/Iok
         gGlygubBaVsXaA3XbUOmxKCSQc0mDaZeYxcw+XVdbM6hBs8bXOjfOuNRQFM/vKqy/IEV
         J+oGOlTju1cKUjKTEScgNOA3YROZ5iUwkJKpZt55ZIySKJGkAgx8EMgnHmFofnb5361e
         NOrg==
X-Gm-Message-State: AOJu0YxyoIIs6v9oj/xx6Mu0tW9zyOL0O1EAXH5FAnkm4TK7aDrUW+Pk
	Y3Mn3f1rQV2jPYoQsOrJq48oldVnQliKbzkqDCYqUi/rnrP0VgwlKuSm
X-Gm-Gg: AR+sD13f7Hw5iK8k9+adR27uVS1pnwIFpErg7hP0XHW5mlFS392SaxpA2mWjXro+2JD
	bvhIGxC0qytqldzBSp4rf5tod5q3J4UiCUzjF/OJm8weImiWGCjyWXbSiMNBVSLp6fbEHjg+mRN
	lV050rexIXanGxj3OJp9rI7NdEE45dKsSCHHYXxtelhOwdawVDHr9L1limKB0qGqxNWAtR9jLvc
	BYZzTq7tIdQTIp78BALylS83vpy/SvahGLzFxqTPmo4IPQEdduoMzg6IF6AYrThMB7iEFWY2Ax3
	LyUE5v7gE9LA+iWzjAzf6GL6MiOlv979mTfKCqodoolzQlmYF/IbhYarLOELRC+wtkdxoqbpQbe
	aPj/ynVvrUwbnmbwWdeszrKiEoEiOv5B7LHhXP1Jbc+OEOWKdFfqBtHtfXPQ2x08pRRrZq7ROUx
	VI6CJhz7A/9lZeQI1TouBulB62o6EPG6OcCRL/43AtWVYosbGUGyrDwa6OpssM2Fw6waKvlRN+H
	JKw7DUIsR0CLUjdY/Jh/H5NmYsw
X-Received: by 2002:a17:90b:580b:b0:38e:9e9d:9209 with SMTP id 98e67ed59e1d1-3903c5c51cdmr4272210a91.17.1785909334948;
        Tue, 04 Aug 2026 22:55:34 -0700 (PDT)
Received: from [192.168.20.42] (115-70-157-242.ip4.superloop.au. [115.70.157.242])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315867bc261sm11717163eec.28.2026.08.04.22.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 22:55:34 -0700 (PDT)
From: Tsz Shan Chan <tsz.chan.dev@gmail.com>
X-Google-Original-From: Tsz Shan Chan <tchan@jacques.com.au>
Date: Wed, 05 Aug 2026 15:55:16 +1000
Subject: [PATCH 2/2] pinctrl: sx150x: get parent IRQ trigger type from
 firmware
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-sx1502-v1-2-6434d51fe909@jacques.com.au>
References: <20260805-sx1502-v1-0-6434d51fe909@jacques.com.au>
In-Reply-To: <20260805-sx1502-v1-0-6434d51fe909@jacques.com.au>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tsz Shan Chan <tchan@jacques.com.au>
X-Mailer: b4 0.14.3

The driver currently hardcodes the parent interrupt trigger type to
IRQF_TRIGGER_FALLING.

Use the trigger type configured by firmware instead. If no trigger type
is specified, fall back to IRQF_TRIGGER_FALLING to maintain current
behaviour.

Support IRQF_TRIGGER_FALLING and IRQF_TRIGGER_LOW, which match the
sx150x open drain active low interrupt output. Reject unsupported
trigger types.

Signed-off-by: Tsz Shan Chan <tchan@jacques.com.au>
---
 drivers/pinctrl/pinctrl-sx150x.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index 015b1d0744e4..62c582a52b3e 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -1125,6 +1125,7 @@ static int sx150x_probe(struct i2c_client *client)
 				     I2C_FUNC_SMBUS_WRITE_WORD_DATA;
 	struct device *dev = &client->dev;
 	struct sx150x_pinctrl *pctl;
+	u32 irq_type;
 	int ret;
 
 	if (!i2c_check_functionality(client->adapter, i2c_funcs))
@@ -1224,10 +1225,24 @@ static int sx150x_probe(struct i2c_client *client)
 		girq->handler = handle_bad_irq;
 		girq->threaded = true;
 
+		irq_type = irq_get_trigger_type(client->irq);
+		switch (irq_type) {
+		case IRQF_TRIGGER_FALLING:
+		case IRQF_TRIGGER_LOW:
+			break;
+		case IRQF_TRIGGER_NONE:
+			irq_type = IRQF_TRIGGER_FALLING;
+			break;
+		default:
+			return dev_err_probe(dev, -EINVAL,
+					"unsupported irq trigger type %x\n",
+					irq_type);
+		}
+
 		ret = devm_request_threaded_irq(dev, client->irq, NULL,
 						sx150x_irq_thread_fn,
 						IRQF_ONESHOT | IRQF_SHARED |
-						IRQF_TRIGGER_FALLING,
+						irq_type,
 						client->name, pctl);
 		if (ret < 0)
 			return ret;

-- 
2.55.0

