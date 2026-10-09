Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F9C48C3FF
	for <linux-gpio@vger.kernel.org>; Fri,  9 Oct 2026 23:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791588383; cv=none; b=H1w3YuaBja1bf6p2Zwt7uaqSXlA2KX3dni6MIZYSWkPWi9qhP1KEkxpar17m/8nX/D9rnB0IN8n6vB7t+usjdEvfVPS82Ko/XsYg2GjjKrcsb/vn7QLCORBDRf5j9dfbmW1v7UUft6OPPuJpYt6wBE25db7zKgfszU6+zpPig4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791588383; c=relaxed/simple;
	bh=V5O8dJGvVTHLXZ79IY3HVKNJHoLUT5+l5KbQEv9k3cQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TE9pRL5YggSKvV+/GT4nsPmzG1meOwXrj4+/aIXu/xqgnbAu75AJ1mRzFfsmssrEoKAtWPEZImLHrQeviFXJQ47MlXi9lc7oly3XARgecdfB/7BGCN6L1/l2LhXXXCeLGbZTjB8nrVFofHbKSXy3kHkMz3IgE/8lk64wZo8NKeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=cBZzdgLt; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="cBZzdgLt"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-82395ae2ea8so238388a34.1
        for <linux-gpio@vger.kernel.org>; Fri, 09 Oct 2026 16:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791588378; x=1792193178; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NszE5JWc8g05JKm5j8AkIMR178Aewhhb4qePMLYWK8g=;
        b=cBZzdgLtrX386sodsiaUUI4v7KHRDIGmkBu1KOxdblm8e4tXEFmDhkxqiDLFc/Wmc6
         LQyqoixFbVt9czaVJXflhJuTH71aQzd5SaPu2iqdLJ89DM7gQtH5ObzRLsiErfkx6g8e
         oPNNCyJrqhUNozlrBhAbxKAQC5eDZyA6KAxO03S5pgi07UweVEaDpA1gJRSl8f+u7R7D
         3MmkwZHD0gfyTNWd2o3CZgD+TGkjtzNz/N3ISC1G77n23da7xUZB9ZHweLmSdbF61q5K
         hXPQ7vzi1RrPl7kCzRG6IwJwGXQKyK+JiUkliwBVybKvFszzw4/rMn8xZXUq7e0hmhF7
         RPfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791588378; x=1792193178;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NszE5JWc8g05JKm5j8AkIMR178Aewhhb4qePMLYWK8g=;
        b=yir0ebJ7xhJx3gzuDUZxruK+c/OGt3F6LbTlKrcyrtVGFnhB/mK7czSg7qw1RSGksd
         K5Ob7HsCMnA0Da+ovRi4JvxvxO2c7BKTaR2Rygp3kq3Woj4wzp5MsYn4GS2uVEz33Ukr
         IKtcvr2ssOrwb/HIDDHpWRtVzVFj7reKJjhCZ3oVj+uAaNcttqedAv8cIv55AIfG2G3Z
         OircIDp2lKbzcufw1UBYQEVuCNQXsruJLJZqz0JU7miWAIvEKjVRfH0fpMM1AyyIzUJn
         1nTmFLjLc7E3mAMekcuiYabNf55DRPJ8Tn6yubgwZyLmSGKk/6scW6HipTHWuEI9fwVo
         2H7A==
X-Forwarded-Encrypted: i=1; AKwUvBzNbh8I+nqQQd3TRLXHsRkgdn2o01tuWkX2LCtpSyUeYtCGM/T5beL3+EV32a49QHtvoveSoZDueUrb@vger.kernel.org
X-Gm-Message-State: AFuF++mnK9gxr3eoixbvxCL6AxV5fY7atPlsF/Okdf1TfTGRnKR6hlhM
	JEeIPyhQ/7bW8686dVSBHkMD14OZXbHHomgzODDRNMZkdAvqa9DL4RyPn2uCVigWVk4=
X-Gm-Gg: AYBFou1ob62TQpjaMhrUe+Q9mYcAgNWw05yFO4gBcjUld1dtFvoG9mbKF5qHsge9DJ+
	+p3mRLdJqqFA/QltFAbR5FruDKuyUEiACQUtBtk7nAorOX34JlAiFR9PJi7zJuVPgiqBf4LKmBC
	m6USul3+onQmb264fYIHLu+QVeifPql5HLTYp3po0KWumBKMR0DmM4ZEjwNBiCHYeH5Gyu0QjQx
	oe8RN9Yq8GKdKTEi7HI4l+96w9G85wlNg0/uSMMzu3JFuE8vY3LpYi+kWnNXnc9NKUI/gQlF6cY
	peZ/A2xz2erNlx/7f6+knAO+h6/f/etg2Buw4bwRjcXhgPEIKIWlVwXcjt8j9WbFH4TfO10Uckr
	rjf41B/V1hCy3CGGC4HBdtYqZcEuax4DBrUlFyceAXytylVghCxS93WNcwgxLPITtp6YM5wMGT1
	oF5EKboZkSqoi28BvZjGekf4bCBwXL2QVfajjOtiisIeXm4+5DE7PYbXyIhJXlHiLMDR2N7UWkG
	4U=
X-Received: by 2002:a05:6830:3892:b0:822:6f0d:d04d with SMTP id 46e09a7af769-83095a32c5bmr2862182a34.16.1791588378320;
        Fri, 09 Oct 2026 16:26:18 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:29bd:56f6:5ae7:35d2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-83038f82468sm3293817a34.11.2026.10.09.16.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 16:26:15 -0700 (PDT)
From: "David Lechner (TI)" <dlechner@baylibre.com>
Subject: [PATCH v2 0/2] iio: adc: ti-ads112c14: add gpio support
Date: Fri, 09 Oct 2026 18:25:50 -0500
Message-Id: <20261009-iio-adc-ti-ads112c14-gpio-v2-0-3231a795fa63@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NTQ6CMBCFr0JmbQ0zoggr72FYtGWAMUpJi0RCu
 LsFL+Dq5Xt5PwsE9sIBymQBz5MEcX0EOiRgO923rKSODJTSJS3orESc0rVVo0QJiGQxU+0QXSx
 yYzKbpxkixP7guZHPvn2vfhze5sF23Aa3RCdhdH7ezyfccv/8TKhQkSZDeGXTnPTN6PkpxvPRu
 hdU67p+AeVkziHXAAAA
X-Change-ID: 20260925-iio-adc-ti-ads112c14-gpio-197bb4c70411
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Chris Hall <c-hall@ti.com>, 
 Patrick Edwards <pedwards@ti.com>, Kurt Borja <kuurtb@gmail.com>, 
 "David Lechner (TI)" <dlechner@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1281; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=V5O8dJGvVTHLXZ79IY3HVKNJHoLUT5+l5KbQEv9k3cQ=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqyXgDfeWsuBRQjv+CT9pO6s6OEFyD676vZm2ga
 GSJXkFPbrGJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCasl4AwAKCRDCzCAB/wGP
 wGdZB/0WnAcqSkRS2vhMq+W0Jowrz141X8ZHRI7AtfaLaNZm0BmDq7zZx4o7jDMMen2Xz7t2XEx
 yWzLGWlkVf66Uo6v+smNKp4xQ2fyrOyvHf2TT2FpAZcgvnjLRgUI/4gH0r3zDs2G2m+a4L6e/Lo
 PXl2hGW91KM7HUi9+x42I2tUS5U+GaO/yPP4fA+ykst6UpYUv8jnYYcmqOk5WoO94SJVuyo0kPb
 KZZlr4mKt2XxTWbWdqTJG3JJH26wGo2m86YNMTHA9FIzqd51bwESDw3+TlEAnQvnsIGgOJ4cveW
 g5mNPraa1GVb80IW0/7L1yw3FGBa/48CVOpy+8DqhsJ2LAzU
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Add GPIO controller support to the TI ADS112C14 driver. The first patch
is a small cleanup to make the GPIO register field macros usable with a
GPIO offset. The second patch adds the GPIO support.

Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
---
Changes in v2:
- Split out GPIO register field macro changes into a separate patch.
- Make ads112c14_reserve_ain_pin() return ain and use it in assignments.
- Shorten names of GPIO reservation helper and mask.
- Set reserved bits directly in struct instead of copying from probe.
- Use non-atomic bit ops.
- Drop unneeded bitmap_fill() in init_valid_mask().
- Add GPIOLIB dependency.
- Link to v1: https://patch.msgid.link/20260925-iio-adc-ti-ads112c14-gpio-v1-1-2a2b218ebf3a@baylibre.com

---
David Lechner (TI) (2):
      iio: adc: ti-ads112c14: parameterize GPIO register field macros
      iio: adc: ti-ads112c14: add gpio support

 drivers/iio/adc/Kconfig        |   2 +-
 drivers/iio/adc/ti-ads112c14.c | 191 ++++++++++++++++++++++++++++++++++++-----
 2 files changed, 171 insertions(+), 22 deletions(-)
---
base-commit: a3b3580713f3ac5a32dc2874ee546828977a1d68
change-id: 20260925-iio-adc-ti-ads112c14-gpio-197bb4c70411

Best regards,
--  
David Lechner (TI) <dlechner@baylibre.com>

