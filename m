From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4] Fix sun7i pin assignment for IRQ's
Date: Thu, 25 Feb 2016 10:26:34 +0100
Message-ID: <CACRpkdbh8Svn4Y8XfoXVBzTuePufoZGaRVe8AALT31uK-aawWQ@mail.gmail.com>
References: <1456096638-21961-1-git-send-email-henry@nitronetworks.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:36210 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759412AbcBYJ0f (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Feb 2016 04:26:35 -0500
Received: by mail-ob0-f170.google.com with SMTP id gc3so42922738obb.3
        for <linux-gpio@vger.kernel.org>; Thu, 25 Feb 2016 01:26:34 -0800 (PST)
In-Reply-To: <1456096638-21961-1-git-send-email-henry@nitronetworks.nl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Henry Paulissen <draakje197@gmail.com>
Cc: linux-sunxi <linux-sunxi@googlegroups.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Patrice Chotard <patrice.chotard@st.com>, Fabian Frederick <fabf@skynet.be>, Lee Jones <lee@kernel.org>, Hongzhou Yang <hongzhou.yang@mediatek.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Feb 22, 2016 at 12:17 AM, Henry Paulissen <draakje197@gmail.com> wrote:

> After testing IRQ pins we found some bugs in the pinctrl declaration.
>
> Signed-off-by: Henry Paulissen <henry@nitronetworks.nl>

This v4 patch applied with Chen-Yu's ACK.

Yours,
Linus Walleij
