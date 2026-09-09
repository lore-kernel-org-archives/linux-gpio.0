Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C9254CF7D
	for <linux-gpio@vger.kernel.org>; Wed,  9 Sep 2026 12:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788958245; cv=none; b=DOED2rxwf3vXpNhFsH5qSG6WhS6oSngACiFeO2ucZVPYtmW/nl0Og6al1SkmgQpuEiZeZw4TWzIPDgiSC7GVGH7APlvQ3csU1tVrVU+1pA7ft9KGWGVjkIks1Vir8mX2Cx+WPkqY556OOZdKHTdqeNnepR+/kncYmYeK5Qo6tF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788958245; c=relaxed/simple;
	bh=Y7xQ5kj07/NhPItFH9EAGNMwg0Qh5gNSAHX3bpdW4BE=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r3E7UTow4ocYRSFqolgHlZQinkqSRRH+eHrGL1XYd9GTEf2aXlbrni/dKUq3VNwDaMbecH3fE9b4t1x+yfQnhkPnUnsnjhizXm5BocKcHdVlhHNh/+B5C+8XWajnRtVW/Ak/vvla388iGr30LU0PVWxEmN+eueWkHrIREZEEjW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HDmO2d5/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HDmO2d5/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 224841F00A3F
	for <linux-gpio@vger.kernel.org>; Wed,  9 Sep 2026 12:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788958243;
	bh=Y7xQ5kj07/NhPItFH9EAGNMwg0Qh5gNSAHX3bpdW4BE=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=HDmO2d5/0DmZVwk3WrmNcsoK/T39YVKjKXASoGwBuC2ynrSGDSVBTib2NNEgHIn9x
	 ER0JBsYzk3nin57dDPPWRH5mvVL/ifJsc18kvsH9aB1vaa/IbbE5VJIg0iZoYUIRFc
	 eJqqVK/ZxOKjfMONfMvRKZkFWPYyUB4lr/l/VgPoCcwa5SW/9pjoLK72POcJG4om4R
	 dphR8sjdY2FAi5re2jHh+giDTSUTGc9wQphohh1PSqemReImdO7dUxEs1hq17Lxz0G
	 HVRJmVHyMN96UyLSYezwlo7qtfhgtc6oCihwc2mRzO+VRNKTRi03bhN7H7EUHsIHcb
	 tsMdlp2eY8f9Q==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b89986bcecso34951e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Sep 2026 05:50:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByzLZ61bK2xXXgyD297pe3vyP1nC6n+A9qQIEMgLYF1UuRfOr80dDY5C08iRt2PAC/kO5pui9gBY7hn@vger.kernel.org
X-Gm-Message-State: AFuF++kJkI9cVYubk5pYSYMpiO8UabGXbmfiauMH/e+KwMKHC26PIzJp
	gf0yAAXv9mUlCJMb3lBC/Z+9PURPZyX/t4886UzmiA46/8uYxX6DI76S9q9z8COJ5QjVs3IlLtL
	66iB7+k/kRdfcow91i4SwUVfKiKF+JXChvgHLwG0FkA==
X-Received: by 2002:a05:6512:15a1:b0:5b6:4ae:8c03 with SMTP id
 2adb3069b0e04-5b61706b263mr6165808e87.30.1788958241800; Wed, 09 Sep 2026
 05:50:41 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 05:50:40 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 05:50:40 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260817185700.322370-6-cosmin-gabriel.tanislav.xa@renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817185700.322370-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260817185700.322370-6-cosmin-gabriel.tanislav.xa@renesas.com>
Date: Wed, 9 Sep 2026 05:50:40 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeytEdKSRK2XZm+PrX8X_X__dWzxqmDDY54D_oigf9_Qg@mail.gmail.com>
X-Gm-Features: AcwNN1Xni9hM30thqVh6rPytkEi2Gw2KWmieTj4_QQuyfVVJ91FjJPZqeoNRyFc
Message-ID: <CAMRc=MeytEdKSRK2XZm+PrX8X_X__dWzxqmDDY54D_oigf9_Qg@mail.gmail.com>
Subject: Re: [PATCH 5/7] pinctrl: renesas: rzt2h: wire up struct gpio_chip::set_config
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Aug 2026 20:56:58 +0200, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> said:
> Wire up struct gpio_chip::set_config to allow GPIO settings via pinctrl.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
