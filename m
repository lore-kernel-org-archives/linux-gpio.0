Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C190C196C7C
	for <linux-gpio@vger.kernel.org>; Wed,  1 Apr 2026 00:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775003782; cv=none; b=acIVS4WjATFCrjwaLBf1lalmOr1rL0/s3tJEf+lr3iHSYjxd7Xa4RipDs+5TUX/wpEysgCMT6nYbIVwOjgdqu0uzvsN9CZy7Ovi8f7fuHEHLSr3LYzgskpB2f+RdcNpN64UCEGRuhL8XgRtMZFSAZqrt+Sw0UE1oM0gGbmMlgUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775003782; c=relaxed/simple;
	bh=osTPLN0RQ/XeSuhMQ/GV3cT03A6c3tExd2Q/kFEHnOc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O4oKVO6H7GQpfUOM4E6izJkBLiJcAfSwGOsdEql3deMYCpxsTCPkVd9EIXRXp82wjSqYWKdrgGthLmfKB1WaouYMM9zFbdj6ibTDeAWs4qEVHvEoJwgdnIr8q6O4kTVN5k+JbmXbc2V4TyqX4G6V0E0SqxrntlpXZtw1Bfh8N3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=chuP37d6; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="chuP37d6"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82ce09b4197so499267b3a.2
        for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 17:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775003781; x=1775608581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jvbcL88GKEUluNY9FycTq/fLFvScGGI8LWzK2NuHQOM=;
        b=chuP37d6bE7X5It8wc9Nr2R18S11R3wv/meSfJXoQyPQlgUsiyY89yeuLw+qFAwBSN
         UdnoN14pJVluixDBGQSHL5x/zEbIUZr7NuR/1e8LDwQjopxmKS9XOuJgCtd025ev/w5I
         EjViNbTuR7QWnaZ5fdhIgJqi7LV071iHNK0DPbJ+b6enHmn0Se0hlqC85khhMO6TGfY8
         vseuA2VPZOvmMmR4lpjC1XJwJm+iAfes/a+04t/V6zRGjtoD7lg2J/qdvgAvOItVTVZW
         OiowoyHHEdIqbyjxa3RG5+sAxDw2WWJhl8ZRC5BhVdDlAfxo4PIkf9DyQvxTZEMh6yF6
         +JAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775003781; x=1775608581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jvbcL88GKEUluNY9FycTq/fLFvScGGI8LWzK2NuHQOM=;
        b=klK1zwcTVUL2uko1meGFTp29kydbwH8xgbkzJLKkaHwSUdVGzMW5tL5UzPDrvUU0JI
         TETqV76TpkV3+TLOKhae1UEhZEH3/8jbxTI/Ou+u1zYDKoIpvoprOR9daw2fdOKCrNpT
         bRTPVrY0uPR9JRz0s7ZE3+zKeNbTQdPzEmG4O13bzo1iSk+R1BxXQ15v6Mrpn1gs5697
         0IBWw4WXZyAM8V3tNzNgprLL1RDiyifBJPbb6E/JMoEesCQxIeAEEOVSk+kLWeS4KuXW
         1oG5RESiwX9YUeqjLhk9WFOaioizjPt1sPoGnZWIluNajCkiq5ZDkvixzZSfyAMSBX7b
         9pMw==
X-Gm-Message-State: AOJu0YzHfPYJT3rFRZVnGy9Pe0w1cP74poYeqN5uRj0sfpwKxMqVcJcr
	XzXwOwL9ZupbbwWZBTyLmT053wryX3hHes6itYixgSQ6GgjqGwyaPCSC
X-Gm-Gg: ATEYQzy0lcIt1oewYYIUarMLec2DJxJE1X5eSTVXJP6baxBjwzR1n01fKb+9I8DMVQV
	vJy9eidAuh9FIxwlBw1tyfpOBZDG9jU2Stl7AcJCB482Rvccg+rDTAMb11jlz8+y41cxFLG3HyY
	7M5irnVs5OYokpusMkCdXMI5i2HrJmBoqUxtLFZuOADtnI+JeK3uac0rxhsnB1Hg0dzvwK2LyoA
	FsuA0rHN3FlwnrhbBwlqBKZ3QUaa/tRLtI4+k2qlBFulWPS0FNkRPeU4N5kIKUGYCvsf8ynQFfv
	bDXUmzvjxealKflYy1Bs/Q8TRRKUYrkGCVzIPzJxGc/7TB6mgQeHrstJYICBpYwDImldOuLHVrD
	xSgjh31g/17xwuhoPfnOLAo0Lg8kjTkVjHQorjGRRlwoMHi7qRgigZv06YIVcjcP8Lox1Fe7tDd
	ktZ4G+7YWMUxDmkOS2iAsCLkA=
X-Received: by 2002:a05:6a00:3316:b0:823:f74:662f with SMTP id d2e1a72fcca58-82ce8b46477mr1652495b3a.51.1775003781167;
        Tue, 31 Mar 2026 17:36:21 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ce713cf2fsm1235599b3a.60.2026.03.31.17.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 17:36:20 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 0/2] pinctrl: sophgo: Fix SoC module in the module description string
Date: Wed,  1 Apr 2026 08:35:48 +0800
Message-ID: <20260401003552.363205-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SoC module in module description string is not correct in
pinctrl-sg2042.c and pinctrl-sg2044.c. Fix them

Inochi Amaoto (2):
  pinctrl: sophgo: pinctrl-sg2042: Fix wrong module description
  pinctrl: sophgo: pinctrl-sg2044: Fix wrong module description

 drivers/pinctrl/sophgo/pinctrl-sg2042.c | 2 +-
 drivers/pinctrl/sophgo/pinctrl-sg2044.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--
2.53.0

