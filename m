Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E4144CF45
	for <linux-gpio@vger.kernel.org>; Wed,  6 May 2026 12:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778071005; cv=none; b=FaYBNxVnnKxjlixj8fFU87SkM80AjEKlvn6ECpwU7jzuZ/0sTMGBg1fZ1f9Dak1UbHNZJk6n39jM+CXSHHXId/jIjdToD9JNillUe9lIxxKI9f7QlCEDaaeIHf2iDFzWdRqbKEShol+AFDgQn0gZ+0ZiAfHrYf1jeDniLbDDijY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778071005; c=relaxed/simple;
	bh=cApX1dihbn8PQ41u5UpHALMQ0+hXvurYSyFH0ym8sdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qV1ipoE5EVJI0UWEpepuaEmpIwivo+QsnuvREzbANg1sOgVXUBEbbtbTKMeSyDH44uYrdfHxgsior+lAfMoGAe3smkYNQqZzdhV0z6UiGVattAjgq5lZ950H/gf6XC8CDpUidpaO1JvhG2aMPtQX1TP+5LKFe3CWbEK/K+ZAIGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iiMGIhpB; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iiMGIhpB"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48d146705b4so24099895e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 06 May 2026 05:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778071001; x=1778675801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1o/09lEmBoTZNo86PdS11r1OH5tVpbMNKESkbLzHhHg=;
        b=iiMGIhpB0stPvBYNqnemhwomtDdNNbmjT2JiBpgd78GoJvuarNPtTtZUXRLL2DZqu/
         vxt88esxGe+IHnSHeUKIFg96IjKRQh+1H/BWSaQXgE3oO4hE6qeYTfKUO0XoN6xH7Nql
         O0Auz3lwPfJ3yKohBQRFYGlq693Bp30LN7abnHCJm99aHBVo8mH/p6JWpp4YtIoEg8Af
         xieXfcMHq89jvMO2cQwaSqEyym6wBHuoaZ7fxGQTkXHG7xV3Qwmd/YJYoAuQkDxGeQbj
         GPjx7HAmN8/AhYQuAo/TldmFsNfFmG0fqbkv4V+W8tggpOpX87DdButxLbMOapSlq+v0
         frgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778071001; x=1778675801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1o/09lEmBoTZNo86PdS11r1OH5tVpbMNKESkbLzHhHg=;
        b=osXbsAYLGDvJOI6Z3ihw2cV1Eohp9FRuCLPhUWZhK+IR81n4sT+sDlq9lY2oAz1XrP
         8JH5AUTUADLGWIYfD3WjCpaJoIsJZH3HodwGsMauo7PvN+i7fhFGKIfRgzPyMLThuypz
         8czznqZ5aqbuUo9uoKE91Kp3UTc3scl1lBIUa1m/svByVCfnS09txqzpz4MfFc15qMue
         Abr+LlfI4EEUubQFYOlNIdHHlZQVcmRi4a4y5+dqRN2uj1O3dwEhIYulVAg6YuSzBQut
         gsogeFSJdWNDKAiBd7PQT8aq5qQuF93uSYbz3bbi50P9LV66yu3okeviDB7hFHo2BDjU
         o6dw==
X-Forwarded-Encrypted: i=1; AFNElJ+1UUIqAibBoX+zn8BBHwS5ty3ikaTqaL9MDqMz4vhjWLLzbgsrDpkZWqRnD6Gc79o9B6dfFR0HpdW3@vger.kernel.org
X-Gm-Message-State: AOJu0YwSg/QG0OEhCSRCvaJNIP6da38gHHG/BZvvC+KkYqUTnFvHIEq+
	g0zHOo3neF01lH3CfXSx+lAwZQlILDhX27+1eBdGMSR4FLJSvU5zq5tV
X-Gm-Gg: AeBDieuqGnMjpYhLuIzs7gdIaF28D4U3LmrFq5IMrYHRO1hVvWQWaPvEoux39ygEYN+
	1T1TVdLONusjo3Jv50qfubxd9tzjwxnHb32Dj0KYgFKDQ2iCTMMP+JVp0UeSiho5EYoFNicY9Jq
	FAklhOPXLXCTBspxeyarTg6/I0iJw6PKEBQFDbTTatPB4rdVGTH3iCX4SRiUz6Nn+AwGqJIiZWr
	9qdec1ElV3sU+xrcFQXfm9rfAAbxaLBq595USR2XHAHmzPCsAVckduqqued+h9Nd8cvfy3onXsM
	Vun8enKXxTOXsBSJKJtW0ZQrmxWnB61It1BbuLmvWFgAKiOIs3FSvoGK/lFyUo1kl+lcHd6vOz9
	Qk8ZYlqxp/hXRm75rpMY4SBT7aBQtrLACfxrKk78SMCFpw/MHoJvYIEDJ8O+LOcynvWieK8FbCy
	ZboTO+HJho8qPk7+jmAf4GhW3fjA==
X-Received: by 2002:a05:600c:a10d:b0:48a:563c:c8e0 with SMTP id 5b1f17b1804b1-48e51f21e7bmr43775645e9.1.1778071000773;
        Wed, 06 May 2026 05:36:40 -0700 (PDT)
Received: from ROG ([2a01:e11:202b:40:68b1:8d59:e348:c16e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530cf964sm31767485e9.1.2026.05.06.05.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 05:36:40 -0700 (PDT)
From: Marco Scardovi <mscardovi95@gmail.com>
To: mika.westerberg@intel.com
Cc: mathias.nyman@intel.com,
	andriy.shevchenko@intel.com,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <mscardovi95@gmail.com>
Subject: [PATCH v2 0/3] gpio: acpi: modernize resource management using cleanup.h
Date: Wed,  6 May 2026 14:35:32 +0200
Message-ID: <20260506123637.1077421-1-mscardovi95@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260506113215.GK6785@://intel.com>
References: <20260506113215.GK6785@://intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

*** BLURB HERE ***

Hi Mika,
thanks for the quick reply. Unfortunately I noticed too late that thunderbird had
broken my patch during copy/paste. I'm pushing it again using git send-mail.
I've divided tha patch in 3 smaller pieces: let me know if it is ok for you and
Andy. In the meantime I'm testing it against KASAN and kmemleak as You suggested.

Let me know if there's anything else I need to improve.

Marco Scardovi (3):
  gpio: acpi: modernize resource management using cleanup.h
  gpio: acpi: modernize resource management using cleanup.h
  gpio: acpi: modernize resource management using cleanup.h

 drivers/gpio/gpiolib-acpi-core.c | 68 ++++++++++++++++----------------
 1 file changed, 35 insertions(+), 33 deletions(-)

-- 
2.54.0

