Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA18E43CE4E
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 10:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787825438; cv=none; b=d+TjmbdLj7Y+stgtCYBq0AW9nRB45/G5N5HYvnVVyh+EAOrZrodZSaSSLctfAv3GnJfEuXXkHabueZnAUgpDSgoXpV6lsuXIUsS9oGRMWeK8DjL8GJq3Ojt4jNdBoX2mlsGq1nrTTUPTdVXE3FLVrvc9BjJU6/5uN+RmQmfig14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787825438; c=relaxed/simple;
	bh=l2VYW4aqfkfpWJPJy6czTou4ysrQ4Px2fgIJDxc4EcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mNIj6KZtIxIEZxBWAxuWxhR2XunvPoLbQc+q7cuag1D9J3/bibwBAB7F+iSjMNmV9mbi/fhy/yA2naLD15hs6tLIApI8N983+a1Carue5rFJHrlTHBgs0tyOshlBjDVICTihftf+GwtMYxiQumWC2+2GVt54fhlnGarGfYlnT7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JoysJfW6; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JoysJfW6"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5c3163a88a1so721005e0c.3
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 03:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787825429; x=1788430229; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l2VYW4aqfkfpWJPJy6czTou4ysrQ4Px2fgIJDxc4EcU=;
        b=JoysJfW6SIU8rmDms6Iz84s3sF8mnb7VaAp7HWaPReU4SQg5l6ZrmjqXEmKjzv7P/D
         a181qH5Vg7hlmVa6YePUi2o2/2iwLumuVUQSBZY2mr2piA5Cxr2SNH1SsQoHKgoUpqqx
         WYuOD4bLOqQ4jDLqhD7Fd0XieqvuYXiFLyS/5d8I+mmOs2EZOZKORbD/iPzGmBQ2z6vD
         cODszY9XaAYrHMr0MzonBRS8Dy2YU7l6iZTkcuncq++/POcR6dwZfi52ZboF8mjNevEn
         UJXHeavZv2Kexzw5A4hm2LxApPJdWNnVYXQTz5H8xW0c/OiYAmrR/8o6NtL5NE/KVjVN
         oXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787825429; x=1788430229;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l2VYW4aqfkfpWJPJy6czTou4ysrQ4Px2fgIJDxc4EcU=;
        b=TfMMfU2cALSpkg5frYY4itNJehPs22TY2EVgBw06fQ00mAN1JTcMxLaxiILkM1YF0K
         z9OGwulh0WCIWeH0kCiIs97sop9fp8/LvLM6KGH2Y+m7y1XMnwcukaEgqxzTrIrmwg5D
         AK/YWgNPs9w259J+TkvuQrAmEp7i2pHh+t78/khnwldDLdxzUJI2TCQ8GyzQNgTK0Vjy
         AaBk4lvTsmFrt/qc7QBjHDYFhR4/MB3B1+cFCDBgUkE4Ha69rLfMZl+cdCERrE1WIYaE
         repCWcfyE1+5SQQ8WWxzk309COXMGpsB5CKVj7O28qMFMszKlFmOoDXYs2OAEP4wZ1mU
         tyTw==
X-Forwarded-Encrypted: i=1; AHgh+RqIojDVXGToxnCTMpl4/3B7jqDR5j4KQx8mvfjxXU7uFRmNbhZH9WCUTLCnRL5hlie+JdSFIVnvbYWK@vger.kernel.org
X-Gm-Message-State: AFuF++lFEtygl07v/5yjwstJ8okvmri/Pt2b9UEz1CYAX3c4k5Uy1Mph
	vneyPs8RYmI37ibpGZoFf2GrOhH7KgIMrN6qVJ/20S7GbQG4ktJO2n5e
X-Gm-Gg: AR+sD13XapS7LMMjeXCB1Xqch29k+d/dNVUXTDgwTV+YCyPeGF0nBEGgHB76Wd0wOH1
	BSZ+MWFdgMYqasLxNt/qv4Tiktd/SRxr3x6DXD26fd9+WB3D3pF0qYp4rDn41zGWPXUVgN8Ftt7
	6Fu5gy564l0CLIP29dLoi6PmGXTZcIXPULyMFuOXllr+Qu4bJ9o3SzEMqMfVM1tm9aTfSK6QRej
	1cGl4D7sdA6KeY0+9wvpm1lkwcihKTOTCUOUNNtl/EXk2VAQItmTjQn5r0mY0m+2Hu58LgmkkIr
	MrpocjPyum7VaHDsYyN0ph/pxIfpWBKZYqiwY3ILXBGLsdAV/cOYN3M2AT8T269eUuPm5o+Qldr
	SC5LzGmJqK5hVgnXKcaQ6OnXIH7bAB4ZgfRiutCnBy/6WdTmbk7VZz9XISqB5yDACNhcd+mchmU
	xcIFpxtrBQuYTIY7h9VxE0gDzFyvIrofGqK2eRcZ6azrt1/sgy2fjRRB28VvhK1mbgVG9l2Z2rq
	vHlfsDBUHrh0iSbd6IAFQb9NArP7yNJqWTz4AckPvLelMIHZ8pKCqOv8DhPkqIxv0Q7YwQ=
X-Received: by 2002:a05:6122:c91:b0:5bf:b500:c4f4 with SMTP id 71dfb90a1353d-5c65bc6afafmr4514953e0c.2.1787825428571;
        Thu, 27 Aug 2026 03:10:28 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.239.222])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c660014355sm3372142e0c.9.2026.08.27.03.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 03:10:27 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH 0/9] pinctrl: sunxi: Allwinner A733 support
Date: Thu, 27 Aug 2026 07:10:09 -0300
Message-ID: <20260827101010.12487-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <bb7eada0-19fe-4602-a2e7-554e914b8205@arm.com>
References: <20250821004232.8134-1-andre.przywara@arm.com> <20260826230720.466026-1-vinicius.eduardo.pedrosa@gmail.com> <bb7eada0-19fe-4602-a2e7-554e914b8205@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andre,

Thanks. "After -rc1" is exactly what I wanted to know, so I'll wait for it.

On the P.S.: I wrote it from my own notes and ran it through an AI to fix
the English, and you're right that it came out worse for it. English isn't
my first language and I leaned on the tool too much, which got you a
forty-line report of something you already knew. Point taken.

The reason I was on your series at all: I'm porting the Radxa Cubie A7Z
(A733) and building a Yocto BSP layer for it, so console comes through
pinctrl. The board isn't here yet. Once it arrives and v2 is out, I'm happy
to test on real A733 hardware and send results either way. You posted the
RFC as untested for lack of a board, and I'll have one.

Thanks,
Vinicius
