Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A72486623
	for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 07:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962592; cv=none; b=p4l32FS6jqZbNtcT8yc6+nbD8mfW2RGoaoQEnn+I0+EjN3HU5SBw/XUhXvds79Af8gQY9b8KU7O+fioRIDILKBf1aPpczQuBro2LQS+e5/QkYge5coco25eH5y6UKkpBmjobSIctstDcKoPIo/O9JcXJwEwuz//roWS0za1/EeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962592; c=relaxed/simple;
	bh=bClARkP3Hs4Gxz7luBgLwLm/lw+NPl5INSd06yJOZNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CNj6AexQrQy9OrXogSbfyk4RkQ/URjdC+eiljymV4pKVLgpRMdFLEnqe2hWxRG4NIATcLQkPDBcWAlawug/j/urT9P7lMI5kSDb7HPvFFnaTo/Iq74UzEo9RLun/+OPo5Eq8cre1cMF1w8MgikxpUKEjfqkFggpRqJjTDFt5QCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ru2/2ncR; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ru2/2ncR"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c14a06c95so2919231f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 00:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962581; x=1792567381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4fpPs3I9x88FPkLwyMiDotfchIunSLV8Gp3fGeRLE/I=;
        b=Ru2/2ncRDqm8VYUFjiRgDEP7f3IUC9NGihKw8UqrRsZ2yzLYxT+Dgdw7sAcME5ZbRh
         TGkeuCI1z10De7yxKE2T3FUAO3S8ytkaRjVDF06a4Anyq1riQUEvVjrw0SwUNfBCAZz8
         LbwbI+zSadlkt29MmI7esZHctrWjtHHOzZxwItyvcead1puKJ9Bg+0lj4Yz1So3+Xep8
         mJXw3StQY7A3IE7V+C7zmwpc//GbgVx77RRb6CJdh+uchdCoEGeSHm1oaC24A6qGa0gi
         hcEP9qu3rK7ud3IU+uAig75YUgiZTQFoQPleFXHpFZSZM+GN54sA8iSOpy9LJzIe4z8v
         bZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962581; x=1792567381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4fpPs3I9x88FPkLwyMiDotfchIunSLV8Gp3fGeRLE/I=;
        b=Z5XuzdO4dQBG7SzJcZpkTFKhddXRkQX/SQ2+YD9ehoSF7Js3nkf3wLJTgnSnmZTzZJ
         Dws4cTj7V/oQDJxQB5gtA1ZMVVKzi9InWWAl6qfVLP3c1dkkTymNNxp2Oq/Pv/VvySte
         PNkjM5ciPKDnIjV1wV49kER9sECvkxcULOBWeJJb0yoylUALChmJUrHDAA3Z267MIVDp
         nfBeZe3Z9OInaN8HMMZDhQ3nhE1hpHXzshbe4TraZMd/yvVJKVRz8Z0Ldza3Am/sJMcF
         jDANjhUOME+J5xI5Bd67KSfkp0R3rGcvezYdfr9gOw1SBSJQijCGHtOApsVbJLe2HZDa
         LvSA==
X-Forwarded-Encrypted: i=1; AKwUvBwcFYuJpPsIfHUphGx2ZkMN8TNbGrbqP7TnC5mdPw0ungLQ6cdOukJCK8bVNn9xQ1wlRCh30K39Kx4o@vger.kernel.org
X-Gm-Message-State: AFq9FYItqTYqaPKavvrHKUVg5TI4wSMQzydI4XBf/VnFqiGVp9i8t//N
	ZvW7sVvvD74oB37S4aqlbpLNILusfciGIBsy3zQezwA2dmmFOasXd67z
X-Gm-Gg: AYBFou2vIi48aqor2aOpZ6v/gh0FKg76XEhxJKDe1AuOkEAd0RmpE/HQCALllzX/5xr
	ThkGm5nE0uyTNNOrKtG36I6klhhKdmYd0vwhxj0T8InNPShLUesvoGa/xhpWeJ3Aqa+hNsYz/QM
	sDTbJO/SPYuDLRdvrXbb2XskOSbbWlTk9DHNPuhIBXdyfnDHNknboAkE0tg0XNePqUxoiCaBpxf
	BHssNLnR75LFRl2ui4jtQCFkGklXMePY2CEq1R70e6OdJR/T/Z6ztNvK/uArSe8DsBpGNfgYkYv
	qekprqVoMtowyPy6Nra2w46uxOQ0l+xeiVkNw1YoS5dw89UB5vmtS4vxcj8lQQo0RtiprM2YLiV
	Sx/B2ezwoMQ3OyeGBQHIdUa0xapyby2uVUTkTPIw1q2QuHV7vPyxwt0oWVYjG0ZM4vWw1fkbYCE
	TEtHSzdfXMsXRVuTbZ4TEyX2IzEBhk30MikFf/XrGn0Xm/deBGraDyefirn/48OCg0qpV9QRqtm
	oAgyZPtwVilAmbW87kx3ufB/PzXZli7kaHpt5pu9GI79gUuyQMmaf6vqxhCWcN8DPPcG7q45K3K
	0cGKtjUwUqTHRme5DaEn0U34TpYdqZopH881gsjcX2LxNyMzc4BnnNS40MTRIw==
X-Received: by 2002:a05:6000:4b05:b0:48b:60d:2b28 with SMTP id ffacd0b85a97d-48dbacdd339mr26410465f8f.39.1791962581434;
        Wed, 14 Oct 2026 00:23:01 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm8500933f8f.35.2026.10.14.00.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:22:59 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/24] dt-bindings: pinctrl: pinctrl-single: Add ZTE ZX279128S pin mux
Date: Wed, 14 Oct 2026 08:20:49 +0100
Message-ID: <20261014072109.1759502-10-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use pinctrl-single for the verified PCIe and external-PHY bit selections
without guessing the unverified field layout.

Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
index afe7329a1d..bd57b41f1e 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
@@ -33,6 +33,7 @@ properties:
               - ti,omap4-padconf
               - ti,omap5-padconf
               - ti,j7200-padconf
+              - zte,zx279128s-pinmux
           - const: pinctrl-single
       - items:
           - enum:
-- 
2.55.0

