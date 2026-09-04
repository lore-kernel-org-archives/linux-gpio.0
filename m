Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C856472762
	for <linux-gpio@vger.kernel.org>; Fri,  4 Sep 2026 10:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519566; cv=none; b=qMLdqUrtjWrxs01/EmUOcayjOC9O3v8Oi3U1qIPyuF2xWVwMGzTuphA+ukyJyIJ4Cn1gr52QxQu6os8njVb4wnNuG3cZIqllK4cyXJQwNYIMb39UTN90adAhTH76TBFE58tl8kB9uIX7cmxbr2Vko6ynMd4d4rYi2WqfFzUNfoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519566; c=relaxed/simple;
	bh=cA8job6qXqmwzEdEB2IZJ+F2iSrbFrc51vamKL3/BKg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a8RgrEL9pgEHGdZ+0cp6Id55LOHV1YRl6FfW5tYKFFJyv54L5JcfmVp6TpUqTOdPH3d8APaBXu99TIMtzjMFl6dlaVpqBwytTfStyVE1JqlUsGIxkk5kh2zsIasSTY8FGNmGk55T6ilfKo/tZXfrRYa8wNUJ89p7x8/qQIY4JU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZPpjA/3I; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZPpjA/3I"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2caced6038eso8960285ad.0
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2026 03:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519562; x=1789124362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CP9sB+DS2YKB5g2OI/tHIWoBap8Qzg/7HUSvRYLgoQs=;
        b=ZPpjA/3IdY2qIE9R1WS6D3NqTwXGuJ4Z9qL7jqLVDY7RRyUB/pBrW4MSM7XS8HMSXI
         Exl1kWRUdrIX2Sktz18jHNWLyoIonXbLm5Z30Fuc02mjF2rUwrwPj0S8+m2RoxSV0AUR
         Lvn3dGjypxhoFPDKyox9fdbCPs6ORT+t+twwWDagddYwq85DXg4QFiR2vsaMhb4wWOAS
         XllxAQy9e9s1C4A+6VRE4rdCodf71ZfxA1u2fYdituMvXhl/xmt3h+yOV7VdHcW2ZIVT
         Kxpyi3l37vhcRl5WS08+i7rAnoFImpH0QBKwKRcdbtQaGFc2Ad/FlVBxgX0nrUNSHEcO
         5q6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519562; x=1789124362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CP9sB+DS2YKB5g2OI/tHIWoBap8Qzg/7HUSvRYLgoQs=;
        b=DOib+WC9tpwyEhIBoAXNLrwOI3ZwWIRW4Ku9OjRvfZguDKPDlTgH4j98TZk1HpdxUB
         YI5Z6iS/CnPdxmP9YsdfxMmWaGD5baJ5egz1TuzVFScghUhCbh0ICeKr4Wm0q+2rby3i
         5bqsQ7sHCMMLfKG0/GV8x0RUMSDN4EuDjoJ405Ir2q2zO6FcOOnJkmUHIBLRxdEvT3n2
         htkewUwuBjhxpX0fjwXMy+5/JyoncB0c32f0j82UmCPjH2IBRH43stb+RcB2K1TBzCLi
         2uHoOLfQuH1C4Le0/8YTxZAsaH+cBbB2ui/9/I0lBCrklw6SiktWUea63bP0qJjTbrEa
         PfLg==
X-Forwarded-Encrypted: i=1; AKwUvBzR9kl84FueyrvL0uksq7YYNa4VMsfO6XTCLzWqRIDfgtQEryVK9hGqZWNTU02ttAEI7prvC53FGl+J@vger.kernel.org
X-Gm-Message-State: AFuF++lEef0lDr91iV6pExVjhFZ0cpyftwV8oR8BSLERRKxrz7q6ZK5A
	XkQpqlKlvp2d53rkWYrrDTKTV23cSCS39yvid6gwDe5FW1fEwnDum5EYc4wFV72rZUY=
X-Gm-Gg: AYBFou0Vq/0Jy1f975HyIF8wqNznhXZDk2mLrRlCkTC1Na7paBQJbYcBcNo6GHl727W
	IS+SQR6FBxH9vDy8hi7878SSZxxc1O6XOMf2QashbB/G7j8L77gU3xW092f+ngLMZjosHfdrnDc
	wVNM0vE6WAiMr7swIbTYH+mBAzpyjbmaG/9YP2YO9GvF6hXmqhJT5iJ4kcnD2ctmasTrAPjN6ZL
	EXGSHgad2akiAWt+yYhEnLyTPfdGzsXZ9oBA2AuZ/Y5yeh2dY6gpWjZKUqHJGX0QGPFF7JAbMhk
	HD8Ef1UdVSTDy/4ekaPwTvJNEk9Xkb9SslIWvLqIvKoFHNPXLU87a1RBYbdD7t3qhHFxh65q3Hr
	fe0yPaAt7g00Pfhxdtwt2L0h7KKw156Z6JHXwIr1R1Sf0lfuBKpMYRkw2/d8K21XyZaJ/YtiyIm
	FCuX+aNohQlqdTawk0PdKFvsQ0TeKz+U/oL3Df7JU+bnrXXU2I7dn3/dUExlk7487DXh3kxlwH/
	/oEt6gOXbXtRtc=
X-Received: by 2002:a17:902:ce8e:b0:2d8:d4d2:d138 with SMTP id d9443c01a7336-2dafb136d0emr102433505ad.20.1788519562511;
        Fri, 04 Sep 2026 03:59:22 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534152sm5731385eec.10.2026.09.04.03.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:59:20 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Kent Gibson <warthog618@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH] tools/gpio: fix typo "amount of times" in comment
Date: Fri,  4 Sep 2026 16:29:14 +0530
Message-ID: <20260904105915.4327-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "amount of times" to "number of times", reported by
scripts/checkpatch.pl using the misspelling list in scripts/spelling.txt.
Only touches comments, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 tools/gpio/gpio-hammer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/gpio/gpio-hammer.c b/tools/gpio/gpio-hammer.c
index ba0866eb3581..1a21e5460242 100644
--- a/tools/gpio/gpio-hammer.c
+++ b/tools/gpio/gpio-hammer.c
@@ -145,7 +145,7 @@ int main(int argc, char **argv)
 		case 'o':
 			/*
 			 * Avoid overflow. Do not immediately error, we want to
-			 * be able to accurately report on the amount of times
+			 * be able to accurately report on the number of times
 			 * '-o' was given to give an accurate error message
 			 */
 			if (i < GPIOHANDLES_MAX)
-- 
2.48.1

