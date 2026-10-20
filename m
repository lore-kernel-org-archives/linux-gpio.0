Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792456699;
	b=1Sw5k5AtWRro3+E+DPDWtvM+bdvqYSvwzd4PFW0Ho037sfNQrxnNmnLILmyCSegnbcI0
	 +aTfvsxIDkKuU8HjyXKDdSQWhNobdfQ3DeLeHkmN5N5SEMo3tuipWOm4FGt7Kt5/sdCvE
	 TOmGxdZZ+lGoKnteOwfvi91qqN35nFTdCQJEBg4SGsH2cN0yXGKSXztQ41sBPd1rNxvph
	 vI/bdKDZ6vFn9yEzCOLjPWcdOvQt7OQOi+1Kf+jrhBs1SEDFs0nWmtQLNkyaJRCLdI5K2
	 TvNiBRv4kAzupO+EoqhynItwDD39KJBsv19zl90B4MIHhyIoLGFpxtm6S5e+OtFGwoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792456699;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WjSXzm+UCz2RFg+QAC4JFHGkAMb2CyRLKFZOF0HvmLc=;
	b=mIp+myU552Ip13VrlME/xFpSmcGJfuhJSmF9pM/5XL+ZtbenlvsdC6r5Eid7DOiToufI
	 QnaL6JFYywezIEp8IaJWHKhvcUMNwVnkI7ma+RkQNyevwGLgZ5oJYFyD++x87j/RuSU9z
	 oP72Q8kMmLaLye0OVuHFRjbkcdyQOJbQ5VeZ7Vu90/amofDWL62LHCzgToEcqP8PkEI/H
	 x8BfOVMiiHwECoZWP/zk3pQnmLr7quZPaHy1aH+Edi6B3S7qihAA3WKT+X4Y4nkkp94Iz
	 NIgnZSiheS0Ui/KFkk/IzuJ8MXO7s+mho0MFp9kDRfw59X6jNJorISfYTQgpxz/sPTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P7AEpIIB;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FA6606A322
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 00:38:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3FA6606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P7AEpIIB
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-846566246e8so83196a34.1
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 17:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792456698; x=1793061498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WjSXzm+UCz2RFg+QAC4JFHGkAMb2CyRLKFZOF0HvmLc=;
        b=P7AEpIIBQ83Xi3gESy11MukAc+DL3d63Ap3JZxWBDQeGtXvzYvZC08V80OasL24yMj
         4pCZk7VmDL7b3NF6Ht9TCPzJ0nMtwt/3AqpQ1s45bRIW9FejHm9ANGjQw8AK4+lFrRr3
         QLMyCtdAFmDkEV7Vhe9VvuH6MMkLkIckIVvhWM7ClVvMCUwvgpWboGFFYqNjdisIA7H9
         hrp5WoCQlDxzLmmHD2JUGv+cVjMjpgXJQbwY0f234w1nZZwMWKij7p84ImMHSAcnMJDX
         Aqt/o7TifgyXru1P1Hq8b+pfLjh8776rwxnSOgm0TNQIKHzIEKqJMfgmI/p/iGod+qEl
         voBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792456698; x=1793061498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WjSXzm+UCz2RFg+QAC4JFHGkAMb2CyRLKFZOF0HvmLc=;
        b=0uxwJZs1ogKtVpq4EIk1mpyM//tv5Dn62ABv+HCk9iEA0p87y90FN9nEkT0AoHarKQ
         EOlMdl4OFOwiTA+v9KYG/Mfe9ydNGWhrXz+fp/hI0LLJ2REru7Tal3B7u2gN626eN0Rv
         foWYfdjPI7Pn+lRRgA/GlXtrmQS6SERuDUMgJXL/b+J9PVOKjX+R9PM2joOFYM8OpucI
         lj889jCXn3t9Iy9aU3H+jfSup3s/06a1SRa09ZHzpMlTjwiGsAxzSjPlOjNwqjrZRikF
         DxF9b6QKVBLHk2cuVy99cju8x6RcZ3oYpNyhGj/iChBSLi1leDm+qGCjZsL0osyvLYnR
         BcYw==
X-Gm-Message-State: AFq9FYI7lqP2zNglnNUCFKgzFi/19nThsm1lFMwInjQcKLXDi6E4UP9A
	G8212o5buBut3nU4lOwO0mIa1M6/EYOcfhSoJXba6ZklyXOJCM2KUJaWPMeO4g==
X-Gm-Gg: AYBFou2ZUoTTm0yXz0GKoyKJBARXQWwnmu4BRx4/OGAQjmTokR0mrFWQEu26DUrAc18
	qxENF1+yrEA4KAA8d/5ooncpQKHGg52wNxfVIPno0VAw1SFLdtyyQFT6M3niGfcJLRuX8495yMQ
	oEkSCghU6sKSOnnYys/GT/UeFRhBaShw74RK4Hfiza6YmaprRfATNDxS8PxDr3T8TS5Y2Mdw1+9
	SBe/c8d4SZvIVKorca82rQoXdlMd4U1XP4oMGQopF7+FC7XIg0P9e66YGvR08MizLj3NHCg+B9Q
	8bu+/yVWYLpX9mtdCTsIRNMg1kH1lpR0vJXqZ1kWkj8A9544SGI5n+rnWXQUSGr656IpovKyS5M
	3skdu5Mya+istUDLIfbCToJP9bha4pi2EDafziQbZB/gmpfZ1lzQHl79By3hL4CpsztPQFxWZb9
	2ENptBu9+ifriFa5YGsEKTt9YnGiXNCbU4GD4zzmbNHO5iTQO6eysEguem+qcNmmoHx3S64seIE
	PMwuhvBA+LTBPbJTmG4ZBVB+Fa45CLEzhQd
X-Received: by 2002:a05:6830:10c5:b0:816:f1c2:d6b8 with SMTP id 46e09a7af769-84b76f34428mr432331a34.9.1792456698036;
        Mon, 19 Oct 2026 17:38:18 -0700 (PDT)
Received: from Zephyrus.localdomain ([66.188.87.142])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm10373383a34.0.2026.10.19.17.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:38:16 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 14/14] bindings: python: bump dependencies in artifact script
Date: Mon, 19 Oct 2026 19:37:28 -0500
Message-ID: <20261020003728.13669-15-vfazio@gmail.com>
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

Bump the build and cibuildwheel dependencies to take recent fixes.

The new version of cibuildwheel enables building wheels for the recently
release Python 3.15.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/generate_pypi_artifacts.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/python/generate_pypi_artifacts.sh b/bindings/python/generate_pypi_artifacts.sh
index bc8aa05..592dede 100755
--- a/bindings/python/generate_pypi_artifacts.sh
+++ b/bindings/python/generate_pypi_artifacts.sh
@@ -108,7 +108,7 @@ python3 -m "${venv_module}" .venv
 venv_python="${temp_dir}/.venv/bin/python"
 
 # Install build dependencies
-${venv_python} -m pip install build==1.3.0 cibuildwheel==3.2.1
+${venv_python} -m pip install build==1.6.1 cibuildwheel==4.3.1
 
 LIBGPIOD_VERSION=${src_version} ${venv_python} -m build --sdist --outdir ./dist "${source_dir}"
 sdist=$(find ./dist -name '*.tar.gz')
-- 
2.43.0

