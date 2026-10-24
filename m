Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792872061;
	b=0WnHRC2RQ/Wdo503EEyA3Emv1WG6Zw2NNRhK7Tk+CVOssi5ShFl7tEgpTFyVOhOEbxhA
	 Nk9gKfeomgd4UWdTRR/yQ6GDcn+YpjzraPiTF8JzhaGvhMVAHL12sO5zSpT+TkhA6XsAc
	 h8eZtGz5mq1wimbVEK1NlppNjjYOTZrTwYptEhS7iRrVjPVjvU3BpmqG5am+HsOoMh0Hv
	 aoHgf9bRPUfocsdl/+FSa7mfb3hwGuxeqN4oA8QjUkxQQUu/nKmn79TaKRL6gl8MTBV33
	 CTo6t65WV+4aDzsu3ADBq9NWgkTCuKjIXPsyE25U9rAdb7f2Vnn6SgC/u1bK6izSbzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792872061;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=m+LA56cKXd3tLPHUbcBJ5I6F7+ig4Ega9nSWySeeHLo=;
	b=pEmiCjHb4uv/Mi4kT8rHCF9GBY3YEevIT604kHF2c/QIkrY9UAAlYCd9jDF9hacFpp7/
	 dw8KWenqcYgBIqydibea6LNQW5SDgZu3SOW56NJhi++aaZS82cjlRrJ7BGp3RGl8hHy4X
	 mJftHHF2ctxJeI81g1OJPGVyYEv3jR/q/XgCC6m6bT1RiIm9GyB9f2yTNMmDvawKIFfWj
	 Ih1tU/l1FJbF1J/QxlotyOIylaAJK7LV9E3LvBhNgkh6/CGjylRFlEMmLwLOXuxKMgfo2
	 a1te3wB/2EKkkE9m4QhLtFSQHwelbHlIINvQTL+6SWMhnJ+vOMQnqygxwOYJy+fPXlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GQ8MfHFk;
	arc=none smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A627606A31A
	for <linux-gpio@vger.kernel.org>; Sat, 24 Oct 2026 20:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A627606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GQ8MfHFk
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4b190cdc9feso1041376b6e.0
        for <linux-gpio@vger.kernel.org>; Sat, 24 Oct 2026 13:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792872059; x=1793476859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m+LA56cKXd3tLPHUbcBJ5I6F7+ig4Ega9nSWySeeHLo=;
        b=GQ8MfHFk4nFS56XMcFLmtUhZndL4havsF5w+KVBjTxCS+bzQ6te+yadrvUDNWGLDjZ
         nrurB1kpHj8W6ltsmZW7pdSWeOv7MZXdkt094rO8k1TbBU5izB5FL3JoncfCzOc/Swmo
         8872aNT2D0dlIiTZvHGXzmWHFix9HX/A/WMdyZ7+E7Ri3qgvTqCTIYY3pZzslKgP9+/o
         1jHNCdpy/G48TBsEGlzsQcMil2LP37WMppEA3ATy4u8Vzd1iiBBtn8Y5NRsTRay2LvJC
         9GLmBwClBbk4Ju3cC+gwJRtbatvTf/SQFtQ3Gp2xNWLiNKf3fiTTv63ZOucOhyJluZ78
         p9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792872059; x=1793476859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m+LA56cKXd3tLPHUbcBJ5I6F7+ig4Ega9nSWySeeHLo=;
        b=NlFUD1ijRYK5QPpfShrazFz5EI8h5lzyslBu6w7jUOUBAnu/I30X2bF4BAw5axh4s0
         BHmY/knICtQ6Q9ibPjlkAw2ZB6Zwn++HEcScng57xtwtKTvJWEMMjtZ++OuQUstSHz8L
         M6b9tE0DayrXzXASdnCdrDJ1PZd+KAMgwWRpomtgXtC8sHNFqIK/e/14wyoKGsjicKxw
         gMkrK1t1yD/FTTunQn+ggOiTwXXT4ZiBX9is8MEIxC9VnMsMi7xni/l/36FliOafHX5A
         vl9wb+0QFNnF4Y5GjEZ48fXuUvSadXmU9JCIhrRIeFQLPETk2DLPtsyoRlS7+U69o/07
         MK2Q==
X-Gm-Message-State: AFq9FYJSpBSZn9PJR6IupI1qiyj/u4TkY9EZ9A5cTJuqoh3EWRhTTv/c
	gZR4nb17jsplYavELnFDf4EXYEvB9YrleAIjbehXhJVxyxGHY2QNpPRYpVOoZg==
X-Gm-Gg: AYBFou0zk//z672zAFKNVWkYhRLUn5B04dgRVMMOABP4ghHVObagjdQi+pKZ9SjgUbG
	Yvq9QejLdPeWmfL0a3NI2vY+EcL/OGVs0ldwXEnN3pU7tKeroNcmPYvUarn4mjfd9cSasohheG2
	/yV+AghgcRmvEjxVVk9jdcud+abGUQ7XNuXhJ0W64HjcJDbPamZGKHNhny4dfmjyI7RMrK9tN1z
	6KE5VgKyXVF4Oe9tYE4wOYWJQ+mTnWYkU0AMcoW2+2nLBA6VfuLfypywWJkdK4H3R7CZjc35W1D
	vZcTEF5jD0w2Q+70bvtbPHo61qEv/EcHDNn4b/vCh7Bg1CA+tw7M7Uk8tIu2U2AjC0eQ9ScF+KR
	fTqx4S8G1RY+UP8LVJwdyoaH8AKceo4XQLkismxekqjCNCMasNODNEB4jCFm69g2w4rhZJMZV8g
	dWrQ7Gy4JR52SmWrIwH9TDxvDxUnwtZNiUOTaJr+XMc1r2LvJ9tNNl2wwUnZy27G1umb7G2OIHk
	26SZviGwTalEVb1BKC872lZFjjdlqrueasxgYK23ILRTeDhEyh+RnMDFgrGDrv5LLUsBHsloccH
	KfiiU4BpUVM+HGhf0FUyTWcAdVXp+EdU42JBm68=
X-Received: by 2002:a05:6808:11d0:b0:4d6:308d:4ca7 with SMTP id 5614622812f47-55c001ece75mr1791596b6e.24.1792872059616;
        Sat, 24 Oct 2026 13:00:59 -0700 (PDT)
Received: from Zephyrus.localdomain ([66.188.87.142])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c042da8c5sm1731361b6e.14.2026.10.24.13.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:00:59 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH v2 14/14] bindings: python: bump dependencies in artifact script
Date: Sat, 24 Oct 2026 15:00:48 -0500
Message-ID: <20261024200048.25987-6-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261024200048.25987-1-vfazio@gmail.com>
References: <20261024200048.25987-1-vfazio@gmail.com>
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

Bump the build and cibuildwheel dependencies to take recent fixes.

The new version of cibuildwheel enables building wheels for the recently
release Python 3.15. It also contains fixes that address recent eMudhra
CA concerns [0].

[0]: https://cibuildwheel.pypa.io/en/stable/changelog/#v434

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
Changes in v2:
- Bump cibuildwheel to 4.3.4 to include eMudhra fixes
---
 bindings/python/generate_pypi_artifacts.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/python/generate_pypi_artifacts.sh b/bindings/python/generate_pypi_artifacts.sh
index bc8aa05..c2febe6 100755
--- a/bindings/python/generate_pypi_artifacts.sh
+++ b/bindings/python/generate_pypi_artifacts.sh
@@ -108,7 +108,7 @@ python3 -m "${venv_module}" .venv
 venv_python="${temp_dir}/.venv/bin/python"
 
 # Install build dependencies
-${venv_python} -m pip install build==1.3.0 cibuildwheel==3.2.1
+${venv_python} -m pip install build==1.6.1 cibuildwheel==4.3.4
 
 LIBGPIOD_VERSION=${src_version} ${venv_python} -m build --sdist --outdir ./dist "${source_dir}"
 sdist=$(find ./dist -name '*.tar.gz')
-- 
2.43.0

