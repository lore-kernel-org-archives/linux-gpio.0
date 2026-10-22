Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792705988;
	b=FmjgfxYNxzga6gbEWqlJOFy8uKSG6aXRSU34ezHBSDLfyo7tr/FBIpbZwu7w4dNnQlOV
	 c70xamMNBUMku5AMy1uPeSI0Jpo4uegW612QlWgTGHVRg3mWKczqkhMNGVJnMKDIwo3f/
	 Qe3Sj8/LZ+Iiki9YnBBrN7dyQSU8fzuAfiTPLmEjfbFcxiHjWSoo1WTszis+WW71fy0rF
	 OKjfpea2eN1Hifz5sBsaXGROeSUevzJx21cF2EwqBwjo1XtAWj9Oll5jSppWWx14zHTJQ
	 +CET6hNO/AGX16Uwcuq6V/ot0X9rJfT20vrZMOtJg28YF3Q5szLUo67gbtm2DN/pd8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792705988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=zCyGpCK8kN6f96iOvStyBKJ/lQOoQDHMwFOCI8a8INU=;
	b=E2D6HB20fhJcFOTU6l317I3fdCLYM+PMxwch9Welo6vApDafzibzwWUOtHa3ml1P5Wru
	 3VQ1eYRVwZUyO2aPMsF//IUkJR0ZdUy15VKY9kVMxTNpQ0cN/5eno90eIT+R2RP3ITUz6
	 P/CNDhRm6HnCFnM4n64rt5hsGK+pRR1KnYBt0j2L96jSci5r7YqXJufXRJLWpdOCj8dJc
	 v0I9U15yxDRm4JYGial4LfuEJ8QQNtmq2lPYQhtRCzd+BfeoSAx1n2uH14RQcgTvmd7WC
	 L771bquYeJXMC3jnkkrnrq6n3wrdyD077AdCW3zRx2JpdX6vPH4y8OYcdhpK9QbpTPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DbjrJBn0;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE58606A325
	for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2026 21:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CE58606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DbjrJBn0
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-15943c9c005so275871c88.1
        for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2026 14:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792705988; x=1793310788; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zCyGpCK8kN6f96iOvStyBKJ/lQOoQDHMwFOCI8a8INU=;
        b=DbjrJBn055ujr+ytdPPsMq0PSUKlC8KPCUMRatG+nCmbQPtmLo2BrpmdP5b45cJilF
         2NGLGrAzRP34KddUhP2Zi/TLomjoaBto7g3lDjrY5hc3OPOmV+L40O7Tym127Id+OgUd
         +JKQat3+pJssQg2Ycj9ILsJoJtwyReJDw2OP2Yl8D3smOqnpUB+GAfVK03KMN18euQMr
         eVPyLFxoApm7x15y7tLrqSG4BncCkkqVV0MCol3nsKUEd5+p/9dbjni6Wg2D987QZ7gx
         8UchbLZ9MHEeeOuTjg1/VgWgVqvjDUDyjSxqvlifEpnZBbmSCBEvfZVKS5NvuXIWVPiz
         VxAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792705988; x=1793310788;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zCyGpCK8kN6f96iOvStyBKJ/lQOoQDHMwFOCI8a8INU=;
        b=WSPXXdo0p8XP8v0PBeFaBpPpjDz3rIffnqbBl8BB0v2FHj7WzolBkgtk8Xg1pKqyI9
         t381WYw8uiJp0xnizem6iUy7IddO0tXsnfkbUN/S3UNpRgnglnsJJdilcbA+Fa3ffLlo
         eoTl4P3CuUbmBb2xNQxM+CYGV8DbksGdwa5rzKMJjRjYcwyYkip858f+AZNSkXB/8Llj
         6sIAGyNJU10naeqFzRnrHPKBFqzxsHyzFRCGGOr5uUHv/WodfhL1bm24ElX3ilVU5ztp
         EttBG5xtYpg+iNjjCn/cEmtdm5Vd7rTPN+XSmd1nI5KZh4GxXG2QjcpcToNFuLeAUovh
         OEPw==
X-Gm-Message-State: AFq9FYJU6WSCRvrVG0GPSZp3R9HK3tyqHS/LzCIuXptMfV3CRYCYce0V
	EQsNwhpE5abrjvIka2sEcSbKHhsDOzPKFq0T96z/xXmce7cZKyCViWVi2DCIfw==
X-Gm-Gg: AYBFou2L1b4m15zqPINzuH6bhurUk1rLyF6XwdE1qhUVEfvczvi/UyuaC22Q/vl0nMl
	QtcGzGcqc+WPFVs6L1Ue/glB5bwfT76zOxvaM3tkccmPGgGgoosOHOmnBQGZFWHxwOQwTPzw7lX
	jcwIq7r9jU5Zf+vvlNRX3WwspLj4wbRihE3auhh+zEST34bQkQ6C32u9k7NRi2AtbX57jgD6RTL
	GkoS8uD+wFNBhpCF/bsugRe0zkU2uGW9pKfgC+sibW1O/fnMuBKqQTOQw66U8qzqEONa/VrBwRQ
	r+lWa4mhYzlxjlg9jcbrVdKolQebWcLf8+1QtpONdcJ0oij0sbF1GiXuW5PW2DO8cMcyVEBUT6V
	2JRaU78t9vTjPHrDBv6LLfWCLUf+z0nwiMfvkwe+41Q/pqS5gmzVQYOGALJ+eyUBpk9E+3HgP0r
	HMLAtc9w9Swnt/XejfExcZRFDEDs6hdwEQJlzYdiDZC3PtwqlG/+djG7ZmIrX+KGygvCZPYVVTW
	55bZepZ7/orO1sJ0qbL1UTkvTX5KD+aMq8IjB88bEN7P/rEkJFu0cSC0QLWXjOT+HVVGo96zRyb
	XH7If9pR3wX3DkLpNPyg8HbowfamgjqKplr8aQKRjz/Lpg==
X-Received: by 2002:a05:701b:458d:b0:143:26cf:8617 with SMTP id a92af1059eb24-195c5510045mr454058c88.25.1792705987321;
        Thu, 22 Oct 2026 14:53:07 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f2d1:b7cb:a745:829f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195ec82eabfsm1110403c88.19.2026.10.22.14.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 14:53:06 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v3 0/5] gpiolib: of: quirk cleanups and TWL4030 external
 mute quirk
Date: Thu, 22 Oct 2026 14:52:44 -0700
Message-Id: <20261022-gpiolib-of-v3-0-42c3b6439fba@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK2F2moC/5WPzQ6CMBAGX8X0bEm3LYKefA/jgZ9CVyklLRIJ4
 d1tMTHejMdJvpnNLsQrh8qT024hTk3o0fYBxH5HKl30raJYByac8QMwDrQd0HZYUttQWUmRSVn
 LYwYkCINTDT632OX6Zv8ob6oaYyEuNPrRunm7NkHcbWGWQc4kCIAkQAoZp0Brg6Obk7C3d22nc
 2sK7JLKGhLbE/+yuQxSznkiUpmm4oe9Br1x1tBRO1V8vvszs64vYLbdDjwBAAA=
X-Change-ID: 20261021-gpiolib-of-4c43744d4971
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

This series contains minor cleanups to drivers/gpio/gpiolib-of.c and
adds a legacy property quirk for TWL4030.

Specifically, it removes a redundant IS_ENABLED() check in
of_find_mt2701_gpio(), compiles of_find_trigger_gpio() conditionally on
CONFIG_LEDS_TRIGGER_GPIO, adds a legacy property name quirk for the
TWL4030 codec external mute GPIO ("ti,hs_extmute_gpio"), cleans up
formatting in drivers/gpio/gpiolib-of.c to pass checkpatch, and uses
__free(device_node) in of_get_named_gpiod_flags().

Note that the companion fix for the TWL4030 codec driver itself (which
fixes looking up the GPIO on the "codec" child node) has been posted
separately [1] and has no build-time dependency on this series.

[1] https://lore.kernel.org/r/20261022-twl4030-extmute-v1-0-3d2dbe260df9@gmail.com

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Changes in v3:
- Rebased onto latest linux-next.
- Pass idx instead of 0 to of_get_named_gpiod_flags() in
  of_find_twl4030_gpio().
- Fix typos and clarify commit message in patch 3/5 and 4/5.
- Add patch 5/5 using __free(device_node) in
  of_get_named_gpiod_flags().
- Link to v2: https://patch.msgid.link/20260724051822.3545532-1-dmitry.torokhov@gmail.com

Changes in v2:
- Fix ti,twl4030-audio compatible string in patch 3/5 (Bartosz).
- Link to v1: https://patch.msgid.link/20260718041311.2605172-1-dmitry.torokhov@gmail.com

To: Linus Walleij <linusw@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Dmitry Torokhov (5):
      gpiolib: of: remove redundant IS_ENABLED check in of_find_mt2701_gpio()
      gpiolib: of: compile of_find_trigger_gpio() conditionally
      gpiolib: of: add a quirk for legacy name for TWL4030 external mute GPIO
      gpiolib: of: clean up formatting to pass checkpatch
      gpiolib: of: use __free(device_node) in of_get_named_gpiod_flags()

 drivers/gpio/gpiolib-of.c | 101 ++++++++++++++++++++++++++++------------------
 1 file changed, 61 insertions(+), 40 deletions(-)
---
base-commit: 8f7df005a7564bd7ffa75da9c3085d5b996f1e16
change-id: 20261021-gpiolib-of-4c43744d4971

Thanks.

-- 
Dmitry

