Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794010154;
	b=YudxWyXowt5GmCH1MQd6YgHGqVHyDRK8ptT4Rzqf4sNmUMDwXxwqZPibWskPzbtwaQoD
	 enA02KEoAp7nOjWw4VkzFOFqxs4iPrUdFrji+2wJxF5dpr8xb+/qm8kXADs2FtQg7X3ox
	 9+RgqRkcKG6B7TFeMwhqlZGJMXsByls6EfDkWzOkYd7EpAjWVq8Q7k2dZEGV+7VVV2IdT
	 j5z2V9WqpuY6IEO1sQYI2eZXq+nwiupbmTxXfIymGPSysFS77e0gQM7whKaJ4L9bWeifq
	 nQfhLAka9r/yr+do/U6AyiiZDgaKRbsqKLz9tO6dcfK4zczVscsee/dAqYND6veqhxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794010154;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=5KZHToixOJT1sSIF1VLXErcQ9JgU3xuOBfoy1PeUWns=;
	b=CHCYcxLZGNJgOz9eFEIfUppeQ20JGvTwFd2VEeeGkuq57oovA+Ef0fbN+AILU7yjGht8
	 UrAsSGZdTkaIKYo4w4f+cLeawetHLh7S6+TlqV2BjSSX00ZLJC4WPewMxxZShthzCfKTE
	 j0ENsDPyP1ow5bDKaUIL0lBty5l0v2q4Hl6Tx7EHOBkJZhX0O1clhPRLg+uq390lL4phI
	 m9Fsf2XyqxwKVWcPeAnOe7PRvjrhKJSYkTX+WDUnnqVO66aT6fA7uB4JbdLE21a3sjaBZ
	 msN4xb26gBbENtrKxrwsx2Z7PB6lQB2V/5p6AioO+xIxsJyOHIz08okaKWoOuYvp1RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M9G4hoiP;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=XB5TBWak;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C09606A336
	for <linux-gpio@vger.kernel.org>; Sat,  7 Nov 2026 00:09:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98C09606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M9G4hoiP;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=XB5TBWak
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794010152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5KZHToixOJT1sSIF1VLXErcQ9JgU3xuOBfoy1PeUWns=;
	b=M9G4hoiP+ADe6vuqpU5lPshPDNGzlF0+Mgdi4yFFqVX0C/mbldcVMwlYLVYdYadUXj0E67
	ouplZYB7/ZFRUttTAcaJMErUhfW3/twJDtEeKEkwWb5KM0GgEK4FhlAiJvhcIiBt9f5IY4
	TIZ81Iw5k0sXQ4gQXY9e4JWR9wBrwSM=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-C_Rbq1VjOuWvDB2BtgzLBg-1; Fri, 06 Nov 2026 19:09:11 -0500
X-MC-Unique: C_Rbq1VjOuWvDB2BtgzLBg-1
X-Mimecast-MFC-AGG-ID: C_Rbq1VjOuWvDB2BtgzLBg_1794010151
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91eb7d1472cso10206636d6.0
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2026 16:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794010151; x=1794614951; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5KZHToixOJT1sSIF1VLXErcQ9JgU3xuOBfoy1PeUWns=;
        b=XB5TBWakX79FzXai3vWXdfE/rApQcOC1g7+T9a1x31dTzII1/4ZL2Tj0qGpwMAJ0QK
         a4Zpc3RG6V5Ep61Cty2pIX//1RQ72WC8J8zUHY8YZzsgwV0l6iRFtrdwvu321YecH0aw
         EIuI5YSQ8dh/Kpg9wEfYp8KHCbtxM2p/vpiQr2fHCRDeoEG97vnNyymvVHDZq8vfY5eI
         rzIN6o1D1gcYBrgRluekU5yB/9m3seloYoR9hHtvlr/Hh0ufw9nMi4ZCOjbMItkfeBG5
         oMlqzaFCwvp6YUpq2rqBpRiiWjRB8ta3TkG+3QKgW2r3nRkbKxoyX6LpBt12myshP+KX
         DkRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794010151; x=1794614951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5KZHToixOJT1sSIF1VLXErcQ9JgU3xuOBfoy1PeUWns=;
        b=UE/K2qQ6QFyNO/mdnJuP/xi8DNZ0sPjyvkDmdzgrvOihi26O6OOXHokcU3PLtDMJ2C
         3tkdBiTka47rIagBukq/lpqoJvXbI5yAR8m06FEeisReQIdiOgOIlWRfDz2E/CBx4Zzu
         QIrTubvhanaF6yan2UT0Bqnk+IzWZDzPR5+vxOYoOn4oBhoSegC9lQSZGJK2VtW6BUcz
         ZVwmIoAwQKYiP3ZQ1WFB1pHq/uf3CVF3NcUOAYsf3m40pI2iVeoTG1I4JKSl5sLYAYk+
         RS2w6jOuXfX3d9UEQswX1woj3noSM2PyVzfB4xmKzDV0UnqwHAz7Y3zhhT1umiZWM8yQ
         baWQ==
X-Gm-Message-State: APuU4Z/APRJrveh4lAmhbuMkOqGJVbPmg2OtxwTX+59/V3r41Bi0Iz8B
	8R3SN766pwlH2sdO/ZV83a2vIj68Zc97OQk6gE1i+ZVSdOAyTVJqAfm/F7Oeho/OfpGrdMeE/o9
	Oibt2yz3GXGeS6Yy1SXe3gQKsffeCqqUDjOCLejY8Xc89o9U02sM+eSx/k9zVpJM=
X-Gm-Gg: AYBFou375rTO1oQfog0S96m5JJTs/N0h92FHMS9dFOf/f779wPDNdE04a1qhehLrpIv
	KpB2ilzj+g7mlw82QBje20dGjDAg0OK0etY8DzGx4nk4FUXqHJGmzQ35x3c/gWHq29nMExMuBgX
	2ethqTWFA4OBD8ZaUItzmMuTNWX8pRdFewfy6P/fAOiDT3adoDWA7gsfTmetkZsAMqB8fYs1J+V
	xAYtygpWvIV62mO6XXbT7eLLOXs7hL2TJ2hhfEFk0lg5QxxHG8eyoPp/wNkgTTPt0MrD4Gt+4FD
	oX3fHU196xZJL//Lx7olputvHOH49PXIifGS5EW7K8U2iDRymcnSdMfap5QCLG8BAgKsjiUskXY
	nqkXE5eH8UzG0dxhs3oPcOCC/WKT8Kx+gBvIf6X1SGZnmkaF545rfmuFnVFTEHLPmhDus0zCR1Q
	L9oMPgKrxEJLlQDw//
X-Received: by 2002:a05:6214:5082:b0:91c:133d:4916 with SMTP id 6a1803df08f44-91ea98f7eafmr62550926d6.57.1794010150723;
        Fri, 06 Nov 2026 16:09:10 -0800 (PST)
X-Received: by 2002:a05:6214:5082:b0:91c:133d:4916 with SMTP id 6a1803df08f44-91ea98f7eafmr62550576d6.57.1794010150131;
        Fri, 06 Nov 2026 16:09:10 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6a2c4b8sm31998536d6.15.2026.11.06.16.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:09:08 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:08:44 -0500
Subject: [PATCH 1/2] gpio: htc-egpio: convert to
 subsys_platform_driver_probe()
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
Message-Id: <20261106-gpio-subsys-v1-1-0785e37520ee@redhat.com>
References: <20261106-gpio-subsys-v1-0-0785e37520ee@redhat.com>
In-Reply-To: <20261106-gpio-subsys-v1-0-0785e37520ee@redhat.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=782; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=f3ONUNPq3Nr2ZHFH9NlyRV0HUVOV9rrABq1PmCJzieI=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLe5chOyV7Mcvz39d3mDJmhhQVFp9Yw1Nrsv93Xb1Ifd
 btm34o1HaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEzkQyzDX9ndKYaMHN9jeZW6
 I++LmJSeWiatqzwtLHHKKp3Gm2zLUxkZ9oWunNlsUG1mouItc2Yn54zi5XvUnCymHFtb/bJw6yI
 vXgA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in this driver and convert it over to use the
macro subsys_platform_driver_probe().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpio/gpio-htc-egpio.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-htc-egpio.c b/drivers/gpio/gpio-htc-egpio.c
index 25a4d4494f3c..0e108d4236d2 100644
--- a/drivers/gpio/gpio-htc-egpio.c
+++ b/drivers/gpio/gpio-htc-egpio.c
@@ -395,9 +395,5 @@ static struct platform_driver egpio_driver = {
 	},
 };
 
-static int __init egpio_init(void)
-{
-	return platform_driver_probe(&egpio_driver, egpio_probe);
-}
 /* start early for dependencies */
-subsys_initcall(egpio_init);
+subsys_platform_driver_probe(egpio_driver, egpio_probe);

-- 
2.56.0

