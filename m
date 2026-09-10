Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BFD495047
	for <linux-gpio@vger.kernel.org>; Thu, 10 Sep 2026 14:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049816; cv=none; b=l5XOyCdfmppJbpjvZFveCby+dB8q+E6jcK+lt8VUvWPx1YlT0rge7JZ4DTbUSNR7hz7mQnV9RPLT+3oZNPJluP9qMiZfjzYR5Xcny/lZHatawRxXGkiZh4AoXNRhRPfn6/zf3+MycFqlSxRGmWFrB4oxZ+i250BVschB5nOkjOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049816; c=relaxed/simple;
	bh=hDP3r5l1mIBCej7ZQl0/zcQrANXp56hh67lg49xJb78=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eCCtG7qGcTFgYW+l7sbutew/ZzozoC707LxjauIT+lDWxDcPsDnRaOTnClsCrYi1ErVyqzKhSCz20VrSATH+mxyiPNy1RqCWiroWho/VE8OfIV8wMIzQs27qyL/3HU19tQDLy+6PUHqq4pYka9mKWtCc++bZ8n2cB84bZiM5oBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZlmMVHM1; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZlmMVHM1"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49ccfae359fso60420565e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 10 Sep 2026 07:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789049811; x=1789654611; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MwyHzbNwR9K/Z6ogERvs94oZtzGoKtSvzGu8br1Oetc=;
        b=ZlmMVHM10BdMZbjupyfy0OnfrhEmlb/3omDg/evvqVT0ujh9t45Pgg6FzspAxLZKB6
         tI9ZkZk8cAhaXFIC9CFK8d2fhkQlLx9ld1JLQPK7LPchtHv4vEgihbRPIbskoD1q8PiK
         NWk9oCbhksClsK1fe5yW+wRyzL/Px1O0vlOxA/9wePk320EnLsWkGuRRDaHqU6caY9up
         t/RQsyKa3XuSrlfBW9jzpin7MtDuSun2QAx2bq79RZ308bkLmzgi5pE9bTgw2G8kqlZW
         TDPsklAkbQCQG782ghD2rh/wi2QZmlDiF0a2NmqS9fQcFvJ8mh2ca6yWuu+h7BeVI7pU
         BbBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789049811; x=1789654611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MwyHzbNwR9K/Z6ogERvs94oZtzGoKtSvzGu8br1Oetc=;
        b=Hv/9NlWEdgGGqZXSue4GELikroAVbWxwQZdriaxbLH1GF68C92g685xoaX8uR+6LGE
         IlIvhEG2mNg41dJCiHS8tucvupqBNcrTXQiUjVBXHYTBlxZAXvXc6AuwhS6HrJKe+0bu
         FwvdmnEqZhDSHMx0e+acIroUQY+UghFgWenQIx5kn6z96ROtAwNyBaE1W2hwUS7TNw+3
         7IbpNaHEkAZKO68Vo7wOlIu3qla/Ql/HgFOOOQkqvX+/7Z4603imQksa4/yTUvgbwLZv
         BlECyWMq81aNZVgwq6bZcsk1CxIVN3gNuNRjpyvUu0RKQe+JvKeQb/B25VLXztQ0sFCu
         2TXA==
X-Forwarded-Encrypted: i=1; AKwUvBxfkQVhEiDkoRar5W+6r2A0VHBAn4KQ6s18wcBEpAnF0+ASG0qnO6scyfCWLtlqltRNmkEuPj7wW8jG@vger.kernel.org
X-Gm-Message-State: AFuF++kQoA8dFsdcXZljrBulrM9Kv6qdsU0DmuRCC4BOMQr7Ch6JJEsw
	dcyu+vbbma5F7oxMIERfbdIJNNj5hR9ugDiTGqFfO5d95vWRYSOtyYy7
X-Gm-Gg: AYBFou1Ilo00+632aeX8WnhroQDHUjiFrbbyi8Nkm89t+xf1nQWsXuNu3VR+5KoqpUN
	uGOwh8lVy9Jfdp9v/Sk22OJ8kprtNfFpTG5cMcwVBOaKA4q3KSZiikkBzksTuJBrZcWzTu2fg9V
	Em4nilaHU05fA82C1TnbOjAjtSBjY0BksEh8ir7zgI6A54HU3mOW8Nr9+YBJvv8tabSaUInHLRi
	PKCcRWy6N7CLMQgQh91QISqX+P4yhA8tySr4SEXcr1G8MpxxZgGy6DPzfDA/aKTM8Wd+t6UK65N
	BYtCk0u/aBD6SNiGhY7ME2RV2Nnh7RgRP0TZALlxg1iHPEjbw/AzzdBTz6vbQ6LeHOlTbSSpZ4u
	2qZNAk66kjLu6ntFroMeEuPOBkJAk2sVqxKoYjamWdPXBRw4oTfRU1Thu9XzcTWEw53oWBWeipX
	ehBna2OiInn54OdQpbE/xqSz/WCwaP+z8I4fx2+ZvWGwegmUKKGtGj19utf+KQgPQf9deUF26tz
	WXHciEbBSRCpwL1bXCjcKzpOWp0S8mFjhFePN+LmcCw89r9wE6KSvkA5mZdupiUvbj+S+wCCQ==
X-Received: by 2002:a05:600c:190b:b0:49c:fc6c:be12 with SMTP id 5b1f17b1804b1-49cfc6cc0acmr351448145e9.24.1789049810601;
        Thu, 10 Sep 2026 07:16:50 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fce7a7sm293895575e9.4.2026.09.10.07.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:16:50 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 10 Sep 2026 16:16:43 +0200
Subject: [PATCH v2 2/7] of: property: fw_devlink: Report unsupported
 supplier linking
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-fw-devlink-nexus-ready-v2-2-17ac82dbe226@toradex.com>
References: <20260910-fw-devlink-nexus-ready-v2-0-17ac82dbe226@toradex.com>
In-Reply-To: <20260910-fw-devlink-nexus-ready-v2-0-17ac82dbe226@toradex.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>, 
 Frank Li <Frank.li@oss.nxp.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Leonardo Costa <leonardo.costa@toradex.com>, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

OF supplier linking is deliberately disabled on OLPC and Intel CE4100
systems. The add_links operation currently returns zero on these systems,
so callers cannot distinguish unsupported linking from success.

Return -EOPNOTSUPP when supplier linking is unsupported. This allows OF
unit tests to skip link assertions on these systems without exposing the
private platform-support predicate.

The driver core ignores the add_links return value and marks the fwnode
as processed regardless, so its link creation and retry behavior remain
unchanged.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 drivers/of/property.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 380df0861ab9..eba7e9fe6c38 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1691,7 +1691,7 @@ static int of_fwnode_add_links(struct fwnode_handle *fwnode)
 	struct device_node *con_np = to_of_node(fwnode);
 
 	if (!of_is_fwnode_add_links_supported())
-		return 0;
+		return -EOPNOTSUPP;
 
 	if (!con_np)
 		return -EINVAL;

-- 
2.43.0

