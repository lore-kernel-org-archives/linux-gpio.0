Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792456694;
	b=OY3JX8IZo3uEx94Y/u+57cPVwjzgpYesYtZWEjXdV1YPaQf1kPE5joanrmmTBK3Hz3Fe
	 04H2TvHYfaQWJ77q1WSIO3sT7ObGSf1OP+qlOZoAN4xDVhzPCSPoLYWoei/D8OMR+4sok
	 ICa8f76xU+T/d3ZlAy0ZByQygmdIBt9jfi9qHe0Uod/7QD6Yxr7u4AziCs3K+vM2GrPGC
	 FvrXaDmRpgIG8KpOm98HYROWaZ7XTEDintR4UUXag5CReIzVy0BrJ3Ic+CwM0OKtENRZm
	 CFEiYQK/C+HW6iM1sIxkEJAO4LN5uMVzxbTI29Imxdu0h+DgxfvT3iQMM7S/eaQB56Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792456694;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8tn8JnJWmK0GHnNl80RNMyzPZfHanshocAXz+pQsArU=;
	b=MkXdimKMQ/rKz/vQ1vP+jXkr3fiB5S9PLXu7T7+oLZmHkONsC47q9zuuIeLGDPPVlann
	 Z2JVsfL9HKLOAu9b2wcky7dem/SQjh0c5yFYKXApW59/x4DFwuMi6DBJadHWQfXh/JN7r
	 uMhsDcxy0NK7EiOE1fVp9zSjeQTzK4YQFMAxSYR1YR6Ji8KIDY4lmlU6JlO+WTOcIEarT
	 dSezqkEwo+6iFNTIaM22e6Uq1DMGsZNT3psaK/Jyrp1QktBWtZOe2YTrBzGeBc34r0gNp
	 t9XhZK9tJ7d8ZOO0ErowKuxqHlL1zMLTTPzdwCQucQFljUWaDJinGp8K1K4rH9ckY+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pSoLyCGu;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34578606A31E
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 00:38:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34578606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pSoLyCGu
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-823b938464fso1983421a34.2
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 17:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792456693; x=1793061493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8tn8JnJWmK0GHnNl80RNMyzPZfHanshocAXz+pQsArU=;
        b=pSoLyCGukF37te6vEXY6NVJN0LSSmjt3Z965VLXFL3MN6R/RetA1TaMggXKa0vVmtq
         USwp/OxzZ47A0REl/1vpqAnLceFMedAelC0Ewr1ec7bdvPePVCN65lFg88oHkGXt2Yvi
         +ZA2pyE7qHR7gVlA2W3/J7FYiI5hVDkP54YB+7w62iX5nZ8gErd88NrSK/MpRiXNSO+6
         XnPw7Pg7C8EW4zIIEDU4M2vFTen2gGYfGOoaC4R+eqA1ZHbD3gLQnmpY9ZmkDr/ouB3t
         R/Rpw5SOjBX+IpQYxPoElX0H0fJRaUMoI2sJz2CmZDDg+Z0t/qMsFtVcPJ7OgIQCb2VP
         /hdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792456693; x=1793061493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8tn8JnJWmK0GHnNl80RNMyzPZfHanshocAXz+pQsArU=;
        b=swFiTG7ApTxYvBgzMmpvM+TJY/rsUMryPsFNeURccJksqk1lbXSRB2sdefIKypQ5D+
         h3dgFTepvSIuW2kFDmlfpfIz2QuqOoyP8vv5E/s9z0j8XuFUraHMV17ddHuL85zzj894
         I0RvyYd0D6i4epwk+rpj275N5JLukJTiZWav83sbo3+2RvkO9ZjtriCCOhcRiHskAs/D
         DXUIyQlwPaazuntMlJtN1ol/BeORJbupwtzsqpQ64Z92eKD0OaFsZfRBAIFo9eBtoQcp
         AOg0poyVWU4b183CUa1m1/OwxXF9xgBxbDYjMta0nJJSxh8rBb5kax3qs1FtBrvrOztc
         7vUA==
X-Gm-Message-State: AFq9FYIT+e4XyepmoSL5nFJ00iwkLyaxkkzb36LYkFToeC0A93i09jsg
	gvLE3yFg/Si/YDFteM4ZuIQxhe7fT30aWPcaeI1IqQU6JqNCmH9nI7C2/bYCOQ==
X-Gm-Gg: AYBFou2NBE89Iqd73z7q57L2YFC+KTAmXEbxrU8x9ApowKZ8IpQxK6WqnH9JFgBVSPC
	gPQoqXbHib2gdmluWSDVdNXr9McsbLGEIEu/SUUqNmAKtpjDMWoqXiTek4pnLXR7OmUQz1yFSJ2
	OuAjcvf0WZVdCSd4pYJvRFg31ZH/V4FKyMfYR//fRAPeglv35pM739dnf+IYjgccJ/mUgThABHY
	NEm0r7zcQUhkS+EkSOkSzpVZfABAbpaC4gYMsz9Rq+tvKE7IUeSRYnM+wz9rYZjpy02F9xdlBb8
	e8sbN5QNjFlWyXyTES4X8BgFYpv3b0u+HtX89npsjvOdMdw6kxSf3Ub66xe6J9yvFEJRyA3kbz+
	Fy52ItI78QSHeDJ3MACMMB+uNSLr6FU/Qoqe0enwVAG40eKdjBqMzCMKHBjavugWpkl1ye9uzNd
	ZL2oI+8Fihkgbjw9ddv8Kps2gh7ZOUzvLxtav3UK/1M5W7KRG6p9PPdV+lHhEUq1JvXF/WjtlH2
	2zepigfN+r5KZb2aVgYbkVyI6qpG5RPfgVw
X-Received: by 2002:a05:6830:3145:b0:81f:da91:c984 with SMTP id 46e09a7af769-844fe39e7d9mr10636374a34.11.1792456693226;
        Mon, 19 Oct 2026 17:38:13 -0700 (PDT)
Received: from Zephyrus.localdomain ([66.188.87.142])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm10373383a34.0.2026.10.19.17.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:38:12 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 12/14] bindings: python: advertise Python 3.15 support
Date: Mon, 19 Oct 2026 19:37:26 -0500
Message-ID: <20261020003728.13669-13-vfazio@gmail.com>
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

Add a trove classifier to advertise that the bindings have support for
Python 3.15.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/pyproject.toml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/bindings/python/pyproject.toml b/bindings/python/pyproject.toml
index 7d1c777..32a4fe3 100644
--- a/bindings/python/pyproject.toml
+++ b/bindings/python/pyproject.toml
@@ -27,6 +27,7 @@ classifiers = [
   "Programming Language :: Python :: 3.12",
   "Programming Language :: Python :: 3.13",
   "Programming Language :: Python :: 3.14",
+  "Programming Language :: Python :: 3.15",
   "Programming Language :: Python :: Free Threading :: 3 - Stable",
 ]
 
-- 
2.43.0

