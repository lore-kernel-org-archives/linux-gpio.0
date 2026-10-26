Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032188;
	b=bCl24yKbhAmyh5eTsuVpH1/Mpg7pIbwy/uJAUy8D/U8DnuMRuxm6YuDnTABcYEycO0EF
	 AUJc263+pQv8axGFG2YFp1liFUj3Ph3LgWR5uxDnwVdLAsed80Ed3lD/m5qvxo/KBrorn
	 LyQvenFhsTbIz6xzNUN3NexNvZnJtWAX01Sfw7XM3/nw4LI8mxl1p90V6K5MCpaXFw6nz
	 dWLEyOKFshGBAiLhy03D9zMbJ46HnDtD9qmSRG1rTfVh/f7ebm1J9/NWwS3bhiveIX7/M
	 REDw1ISzrnFQCXvokt+kwkvZ/9DJ7pw5Qg5lcwpRaF114cM9PvKJ2/morxEJekDRbXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=RKcXzPxvin5lwIxGObv+nbNRfrLQyO7ePF6o4zMOL8k=;
	b=z40i0iJrGaHc5CxkONn8wDnc9FSXMnkoFPurAuopN+DrYCHIOhy7hZkQRwiKAj5p+kyD
	 cryGBI/MBToBDYfHRgCGSqhAZU6TyuEpIGWWkFUoq4dmNdpGWATaxX1NC1PA2R0q98pcE
	 KXd4eXuy9GuE1pxMyfKrDfSievIgeMk6NzJUUnMEvCpfEFGi9ekGZlp4HEOKjZJ/qTqw0
	 Z93EBDYpP6YhP1DiRbFaBryvXEZFykZBnLEnlqGQsIBrCdY5m868uhBMFVAztje5cvdGa
	 Ck5AImdYm5q/viPhukCOjAorGt6QeNUewvixmXTKm1RMVU6F6oOWq7TPgYiI6V4xRhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Hbro5VuG;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7221606A33D
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 16:29:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7221606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Hbro5VuG
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so11687325e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 09:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793032186; x=1793636986; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RKcXzPxvin5lwIxGObv+nbNRfrLQyO7ePF6o4zMOL8k=;
        b=Hbro5VuGgSR36QNwiREnMP4TJ/+1in3seAXuchxuGPpFx+aWPV73L7wySNGlwKsBpH
         mXUtIOq+SRl+q+s2jUBtTx/wA0Oj1cdITvV4FZLErDOpbemsqXJiokC4NhmkZZWyTMb6
         0zp48x0efFpYfd9CbKWEJ2v28VOkY7G7meLf+NsMxGkjl9HVRasTpH66j2tWnJVsVand
         zQlYw0V3//7NvXROz2NDWMINfzdU39+i87kQy4oMvTtQ41wljivZXB+8WkABT1GXJBJn
         oZDKnImufZ+UCxb8dfeqGo1BO9qcag5bwlVGCh7bceXUJ868k1QzFP0g+GjiJDW6Onzm
         hxFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032186; x=1793636986;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RKcXzPxvin5lwIxGObv+nbNRfrLQyO7ePF6o4zMOL8k=;
        b=1x7K2ZpU6vIj9ACFLgD7bG5/I7dJ5wEZBrXmH+KnASYO8YXt70ku25AuPBAr3Xttfr
         GcsoBzp1eMJ23kB9AwKSHXV58Y8QUAjThOdZQIcYdiN0I63F4b/2KW1D/y4fZwkY9cTS
         6AY3DQi0G68R2JdpU/celiBtXV/5mVHPifryyf+vwzFH5U1bnyNldy3+z+b2yjYvQdvG
         bsc7x0d8eUjLz1oKm5hx3H/CjYbznc9dnBeuVLtxpG4YVyxBC/HUhUYs313mZWrHVl5C
         M4Cw67dPbVq2Isfr2D7HgAxZpXCTdnfRRSRFBPM38lbimeCce+ePs1qKY2NoiiYKSaSN
         IaKg==
X-Forwarded-Encrypted: i=1; AKwUvBy4u4rtaNsir6LuKqBMvyXpXX8q6FTPmKbEMker0a9QD3Jl5c+G3x5ej78Ri2Vx7/bHeLEmAMI3PWSE@vger.kernel.org
X-Gm-Message-State: AFq9FYLcKQYDIBBELkIQbdNaoVj+F48Az4kXQYzBUoBwxxTPbGLYbbZa
	DqOIkZ8CpSWQb3wy8oIAoo+sBeIml7oOcRQAM5clwZ1q1h8xBU4p75V0G47z9/5GvYY=
X-Gm-Gg: AYBFou0dBng6YjV25B73+LsidACVCvZT7b8esqiURrQFn5vhLYqNF2+zA3FSAuGnNzt
	ra+c9zvFxuG+H6Ep8cxfvXqde9UYhTB5Sj9tzdzbENgxJqLkccygkS50sohF3Ric46TbRpft/03
	m8bDssHYAne/euZQpjbBO9Gjb/x6LIRQhGkLRwxGFPCFA7Y7HicjiRtXxRL/1PWY3xBXyEIXLZ6
	Zc6Ydhk7mvlMwM4aYIZWHJZZKoKCP3N2h0cATaFDrsR4euXLmdO1bq8hF/FBLziiHprGjUpPqyw
	x/fCTRVM+q1VL8fycnml+ZZidZj9L0u0qXf3vCPKWvmAqu5VveYf3Nh6OiumJmD7wLgUs12xEz7
	8rUI3fUDX/DKlD20R17cMR/JVy6GCjCEHXUC0qrgZ3/HnfCOyrXfoXtdIOH09j0vn1Vkiq63RcR
	YarLLK/9CYfwOWfTJgCu8ckQLtNlQ0/rSwzDd7BEGbeAESbZeuggpM6x8co4JVkUJVD9JRzDJYf
	CoeifD5pOOO6zEAGaO542HR5NxYl6WgG7KQin4+2b23IRKhDhqmuASHDcIGpR5n7lS3BNNIpEhS
	FBepEPtaKlH6wLYSopCv7AjR1wN7qKdcOMKzgbchB9U=
X-Received: by 2002:a05:6000:46d3:b0:48d:f9dd:e3de with SMTP id ffacd0b85a97d-48e3eba4619mr8542409f8f.45.1793032186149;
        Mon, 26 Oct 2026 09:29:46 -0700 (PDT)
Received: from localhost (p200300f65f19a904cbccaa7a4d73ac15.dip0.t-ipconnect.de. [2003:f6:5f19:a904:cbcc:aa7a:4d73:ac15])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3eb8f248sm16845333f8f.6.2026.10.26.09.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:29:45 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 11/22] gpio: pl061: Use empty initializer for amba_id terminator
Date: Mon, 26 Oct 2026 17:28:22 +0100
Message-ID:  <362df5096512d5c88b6f8636bda210ea439ad24b.1793030820.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
References: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=891; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=F0NDFiED5fE2YvaHL9r7KOPlatK3tsaZ/Ub3SUOTuFA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq33+3GslnJo0vs1RP8G1Jr06MrudZvfQdNTA3a YveLTPHoTyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat9/twAKCRCPgPtYfRL+ TotYCACkVWrecmBkqXdQmh7g9WsedfgMJ4EdWmP295ebCc3pO9CHBflnXyXkK9C0gASBAln16ql LE53XIRI7LOe7pcW6nzrWMn8D9T7t2lCzVXlDnHLT2DYvchwtwt7us+K3FcuK07pOi5rIF3pf0X nXgRElzH1axdUmW9lBj5SKwZ6p6sHvDU9BCefOAcGV1cx0WTRQ1W93EJsk5sXV9/Z3mer3Fwj8U xLPxwjxDpWV9Eqiq1wZTitPS8wctxHg42zH2n8+3QKZG6X0NG7xTs0nMPnaJYwGXdp7dBBdrDL5 H4X3QoUJwkWLNukAm133/T7G0l/38nvNzAVFLib+tcQUyY3I
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

A device-id list terminator has to be completely zeroed. Most such
terminators (also for other device ids than amba_id) use an empty
initializer for that and let the compiler care for zeroing the entry.

While touching this entry, drop the trailing comma.

There are no changes to the compiled driver, only the source looks
nicer.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-pl061.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index fcd44e34f65e..f180e5f4493c 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -412,7 +412,7 @@ static const struct amba_id pl061_ids[] = {
 		.id	= 0x00041061,
 		.mask	= 0x000fffff,
 	},
-	{ 0, 0 },
+	{ }
 };
 MODULE_DEVICE_TABLE(amba, pl061_ids);
 
-- 
2.56.0.rc1

