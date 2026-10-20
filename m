Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792456697;
	b=eMTTyD3kt4+GJMdUSETZF/jAfD2my4pM5M5S9didJMKO7F4inbZyDK3bE6DIBvb/2xAr
	 fkEx7i/A1H/th4M3TIvQsDTs0fMxeMldc6t5KWi6O69d8jyT2XMaqRoWwroQezFF62Doq
	 FRIDzEXwSer25sJSFbrUTHyWvKF6aGzc+FOQcPjdalrgYElDAViAjZ63qjFd2Hs4OWH7l
	 d78LrHTUWkbOC17OaR7DZuzhvgykXuCnnDL4nO3ItlWrFv9pSmVYtrod+6a/SaFTcvuVu
	 dok+UkT5xRuUp9tYGQjYFfijEQicbtJ1FB/oJkmTR56fU6rD7gEXOHXlwip8CHPlcIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792456697;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bG+4NoKM/POoluch9b/ukdst8PokUieRTLv6GsP22Do=;
	b=aPs6gqsC2TaCaiqmguV5D15ftW+DDJSvuqo7bQQdOAJCOeTxowRT/uj7VtPoOU5fNqho
	 IMN/23J8gt80gbiwYrfFeOCVc+PSmoitMzHiNhhHoqy3TuDzOxZhxjckGGE8NYC9Y2pPc
	 COmrey+j/eo+3I9LCY5SpQms7SrW0Yjy5tc+CVHJIWOqFFqWwHK5Oh1h3HF+4FHFppCsp
	 dcyDE7OcTlGMRhhlp+cc6W+/N4jcM9mG00A2M0a4wOXSKPA+KGxgjZzKuTpFtshTNX6En
	 oB1djZJgGbtU6qZZACEyn6WdYz0DYdbXj/hWITqNzaofF+5ijswg034XZR/SKkQMkzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=T3VxKS1z;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E1C606A31E
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 00:38:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1E1C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=T3VxKS1z
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-8256106635eso1163687a34.0
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 17:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792456696; x=1793061496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bG+4NoKM/POoluch9b/ukdst8PokUieRTLv6GsP22Do=;
        b=T3VxKS1z6E48DyeA1OZtaXPIUwvRozYiv8CChVpre8+L/Z1oWvni3q52oyCHZE7U4B
         aLDKYh8krrHwGCgDqorroEMFSWtapD7yk/GcYf294PjiGPTkgyHgjKAzDKZeM8kpbTih
         ZPYCb/xPZgpnMYh7+dB4idFHeATYq2njdoiokLYI8gEcLDst2VH71xwrMMSrc+aGxaRv
         mMWYGfZcHX34JJ28fwthjwemEqNYZy72dy/Ig/bVqJpPPzTjt4QqYSPb7EC/xnmkk/F3
         3wNY6C7Rj3ZBALt9O7zVwmCFnfveztHoNPLL1tS7rAh4RyJg2IZyIzBK1ws6fESecKt4
         Fd/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792456696; x=1793061496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bG+4NoKM/POoluch9b/ukdst8PokUieRTLv6GsP22Do=;
        b=BaGXQrmEICrON27+imUc8YnKnNIMwZqPvnzz5d5xJR2vgRZzPrl26ZH4hYsQWXWjZv
         9lrFp+SsmcMUO8CkllljXrTBSkk14ds1LKeu+B15fc7yLwbsVO5tsG2TO/Bb6y5T8AvL
         sBF+mZ2yD0eCWYo+xzRie9CElvar5qT0Mq6B7h1LJqaBuop7FjSuRU6lMmRSfrgtzIXY
         hBqqSbPonKC8ht09i87e+/8x+8mZI5txqpUISwn6Bue2H+BQ5gzEpeFdvH4f95pxIcla
         T9bwt7R+w2gMe4OgifxS3mnZvtaQuwZLDtUs7UYdgADz0Vtl97ZG1ceKYtdXqV6+AY2F
         0dEw==
X-Gm-Message-State: AFq9FYJmqv+CPF0JR09ARjEwn2Y33GL8L7ZT7C1J44GG17Hlbln+Y1IU
	hiqm/idpyvyAqYHqdC1GNht8FI0SRsxXMF3FE+Og3NSAJpBBvQRo3umQYZbeXA==
X-Gm-Gg: AYBFou3ZQy4U6XKf974YeTLjtrKOjHY6QN+kGuJ5yJMaYDR4MmN7/wnEM+t0h+D+RN+
	1NOPpRzmc0KkNu7VoVwkwdJAL4xuxgm6oEMs0NAAeVmt16ZEySJM3wBC9r+xLH3kwUw0uTkOIyK
	RSLvjO/ywRny+wIDUVqgZg1fvK6xzOowBrGfTIZ+dtdtIzvTJXoCklqxsN5wuQAwwkT62mdPyui
	Viu6QKf5mNnNlPUpX5XFtYUTzEC+LOF7+rq6M0UINvPIYdbt2BG6mKWnLtxrfut0BBTP8CqwBm2
	AtfUqeGOP+347Fg2BgSb3qTQM6y0g2sJjIe8GD36d7ePlN409WNnQ4/grYfwnhj4AAVg+X9j2Qg
	11CiiFhuyEfcg6gNUhYhQ4V2puHVSPf+AAc10+bHp/NDrqMpHhXEg1QKudtFPvE4kaNT7nnutUC
	P0tJVqtoolEBGaSrkyRD4rqtUYT3gMPbCcKtfpgf7MgbWmb974g/rwvhRFAsfm+/cO3ILtHv4wE
	lhfPq8Hoy0O31n25Y3N8G19PucZnvX2KhIoLvGhrFl/MMs=
X-Received: by 2002:a05:6830:67cf:b0:81e:b1d2:95f with SMTP id 46e09a7af769-8450190e44amr8941370a34.28.1792456695697;
        Mon, 19 Oct 2026 17:38:15 -0700 (PDT)
Received: from Zephyrus.localdomain ([66.188.87.142])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm10373383a34.0.2026.10.19.17.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:38:13 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 13/14] bindings: python: fix directory validation in artifact script
Date: Mon, 19 Oct 2026 19:37:27 -0500
Message-ID: <20261020003728.13669-14-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020003728.13669-1-vfazio@gmail.com>
References: <20261020003728.13669-1-vfazio@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PyPI artifact generation script had two issues with its directory
validation:

  * When validating the source directory, it erroneously tested whether
    output_dir was a directory instead of source_dir.
  * When validating the output directory, it only tested for writability
    (-w), which would allow an existing writable regular file to pass
    validation and only fail later when copying build artifacts.

Fix the source_dir check to inspect source_dir, and ensure output_dir
is verified to be a directory in addition to being writable.

Fixes: 72d2fa01 ("bindings: python: add script to generate sdist and wheels")
Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/generate_pypi_artifacts.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/bindings/python/generate_pypi_artifacts.sh b/bindings/python/generate_pypi_artifacts.sh
index 22dad9f..bc8aa05 100755
--- a/bindings/python/generate_pypi_artifacts.sh
+++ b/bindings/python/generate_pypi_artifacts.sh
@@ -58,13 +58,13 @@ while getopts :hv:o:s:cf value; do
 	esac
 done
 
-if [ -z "${source_dir}" ] || [ ! -d "${output_dir}" ]; then
+if [ -z "${source_dir}" ] || [ ! -d "${source_dir}" ]; then
 	printf "Invalid source directory %s.\n" "${source_dir}"
 	exit 1
 fi
 
-if [ -z "${output_dir}" ] || [ ! -w "${output_dir}" ]; then
-	printf "Output directory %s is not writable.\n" "${output_dir}"
+if [ -z "${output_dir}" ] || [ ! -d "${output_dir}" ] || [ ! -w "${output_dir}" ]; then
+	printf "Output directory %s is not writable directory.\n" "${output_dir}"
 	exit 1
 fi
 
-- 
2.43.0

