Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EE746D2AF
	for <linux-gpio@vger.kernel.org>; Mon, 31 Aug 2026 15:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788189802; cv=none; b=GedZ32INj2DSRFpdHow4weuy1OKzTuJx+G6HnAkTfs+DIRAHLnqnAOcGQwkvdTWGoxb2Ei6C98B028WU7YKYtROzKt/WBQjyyQUqQUDQ/Vd9swcXsh/RUTVRKYNi/FjyhgMc2oE8gEQS3KL0DCgNILiZAijbySDCP8bjh1IDTes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788189802; c=relaxed/simple;
	bh=VROs6V2JqeZOTOsQeopHbcjKrqF5W5jtcqSlcD7sz5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MVkuQO2DxAdtF6dohlpgOeuGB0GphH8zdFXp5aycrqdv0kMJoIy6Vrp9FSrpWVQSRej+LTDan/pHJj/8hd0F3I/FbQpGnJOJBIP4waNGou6sAr1LvWoEfet0J6Ke38AyIF8GN0aui1fwiucsFUszNb5G89f/GAZBucIFGI7k7XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GFefaMxs; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GFefaMxs"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47fd4531020so2293427f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 31 Aug 2026 08:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788189799; x=1788794599; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AroDAdEC/YeidAbcO1BDQF73gbNPEW2RBPc0/SvGdVQ=;
        b=GFefaMxs7yWjGL637KyVjfptoTZxYUwHdeLt8d3qlOCcR/XjOLPR4MlAgr9OCdmWmG
         UW0bTmbshGpTZO8OM8jUm5FQ11RG/+/5iQUd8qC2IGiKVaRHbYI1eIbgkCThnKRtsQe3
         j1PEHf8GcO5xakyZwFxp8ePyNBvoNItsb8n90hhOTVltrU2r2r/oZUFmzd0mN0om9nvt
         bqQAmLtD4sKzoXtFNvXW6G0oHrDeYEQWuPM95N+xKLYyLSVuA67uMXy32PyThZxDKl2g
         pK4pEB+t17pp/31czA1z8MlqON4+EaQ8EHS6g9h5iiL/YPA+imjJRboHdyPrWQWIk7qv
         HHkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788189799; x=1788794599;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AroDAdEC/YeidAbcO1BDQF73gbNPEW2RBPc0/SvGdVQ=;
        b=b6gzpzVgsrk3P7uUdh7WF5FW9LOQwwFmIVVXXKE8bvQOY9eYJz0D1iLYiA61hMfwAm
         9+2SVpqCEk4LSjrL7P8rq7krz1UxbOI9RKX2VsDSMJsRu73TsQDmJ7syJVObL/3sx1qX
         OjPVab30fBI7af1LR7i6YQ3X05EfMnsUBQwBVCnlYSIgLHk1NduMFRAKBc2//Ns8v3o8
         kq7tXNjZT+C4JJYlVtTYIPG5uI7GrnsXIncB5sWYoB+I3KDJ5IKBKuZExSWJls27Up/T
         0f1dVQqIOAO0H9W8UpkgxGrjOpHqt1KMAWTARG4/nSIdeGiqushRct2V67xmUl9Nbdpw
         yj9Q==
X-Forwarded-Encrypted: i=1; AKwUvBzq9Z21QyGhKn5Ps3UQBHzOBA2JOv/manhJ6tn0Qol/FU50YGKfmpLAlnbWPhMS257asE9XavniZOe1@vger.kernel.org
X-Gm-Message-State: AFuF++l2jWXfkB/pvgx7IKsoNM5FzXI5ORfIIYLnVnEd3fKyIdaZihQj
	/WyOGEKN3kUcN82qkLxxwDMt/V7GytY7lUc5tG2z1NI9T7aVHb+WI5PS
X-Gm-Gg: AYBFou3XHJGWJzDlbImAKAWHPjSW3VbekbdzgeQRlJX8fKdvYGv5aX2/SvVKLHl1eKu
	QfblIEMaaj8VFEd35naCvuTUhEDYTQj5B4H9U2SiZsM9HYWBoGhhSvYrsInNbbOJrt2tOagLaOW
	wGGWgsYkzFj8rSWeduR3DHJDhXLmb4yClImWWo0rb5sevaEifHie4yQX3CJ2c3FMagCfjPPRWT6
	GVTF2PaLzNpExE1w3p2a8EYo++6XKDZJJmKjFLM2/QdXJQgrHYU+Rn+wWslfjiq3eC+4bJHnRSU
	e6CvXk9Ss54VbTElf5buFs1NLRtIUBIWn8SYZagXYjT07hMBGHo84b7IZVLYWfY/hTVftTgf0ay
	MzttP9nsCJ6bk42TSbcVxMr8880ghhb9PYTU2lGgsfZTAjETU//r+dBAjHSHO3jwfiZ9hFjO3Rr
	wc2nkmBCg15Gbc5dUQ3wPmQ6N+Ouy7moQvTHzaIMWnQZwSTGlEY/DFz52IKwinGlGGrjDY1d5vR
	2DtxA+zyLft1RuKt9E6u90h
X-Received: by 2002:a05:6000:27c6:b0:484:3313:48ec with SMTP id ffacd0b85a97d-484416ff9cemr477222f8f.27.1788189799301;
        Mon, 31 Aug 2026 08:23:19 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb2794dsm24234272f8f.25.2026.08.31.08.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:23:18 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Kent Gibson <warthog618@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Subject: [PATCH v1 0/1] gpio: cdev: EOPNOTSUPP when HTE unavailable
Date: Mon, 31 Aug 2026 12:23:05 -0300
Message-ID: <20260831152306.166630-1-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

When CONFIG_HTE is enabled but hte_ts_get() returns -ENODEV (no HTE
provider for the line), gpiolib-cdev currently propagates -ENODEV to
userspace.

Map that to -EOPNOTSUPP so it matches the errno already returned when
CONFIG_HTE is disabled or GPIO_V2_LINE_FLAG_EVENT_CLOCK_HTE is
otherwise unsupported.

Base: v7.3-rc1

Tested: built with CONFIG_GPIOLIB=y, CONFIG_GPIO_CDEV=y, CONFIG_HTE=y.
QEMU smoke for the HTE ioctl path was skipped (no gpiochip0 in this
guest); the change is a one-line errno remap on the existing error
path.

Thanks,
Iván

Iván Ezequiel Rodriguez (1):
  gpio: cdev: return EOPNOTSUPP when HTE is unavailable

 drivers/gpio/gpiolib-cdev.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.43.0
