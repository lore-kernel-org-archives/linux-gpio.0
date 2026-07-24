Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B8A400966
	for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 22:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784931011; cv=none; b=NtfrdJ/yx+LvBL0PiDDIE9anBO5xawyJFMnIJ6v8p6h5lkmd+besjVOAqOV7ebDFDPS3us1sFSfIMpIQK9ueL0cV6sSYprG9s7KCH7TGgYEJEWXyEgBEcnCmN3LYrhLVVnzZPPoBMmE8s7SWZhMgo2yHyVuT8LWcUeouNa1BcE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784931011; c=relaxed/simple;
	bh=XlqJBdTQwt/OCV4IqVEN9S9dyn7uAAKXPCBm7yxu/yE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JHeO+OnoHCjnidJRxGgvCtbhVIN22Qyz723yhM/hpYk3rdBJOMyGdEoJA2D0UmpRSTUFJjtcHw4OAp/R8pzd25xFXf463XnJcG/FVEoOmMhBWKEGr8zxTAZKjtrxCp+UQ8K5U2+thc7+ZweG1mX6qPa9gIxUNFCjVSmYR+5b53c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QPZxZXW1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QPZxZXW1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1E131F00ACA
	for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 22:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784931006;
	bh=XlqJBdTQwt/OCV4IqVEN9S9dyn7uAAKXPCBm7yxu/yE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QPZxZXW1hCl0WLU0pV1Kkl4mf2U77UEpUDfLz+BDedPJAX9yrmJhHsAssf0OVvEcO
	 VOy/FU9IhlQFXce0xpkOYkR83vuDPlsjvoJRaD+HcC/2tnIR8v93xNd1G1l9CC4Goj
	 pWpNnoht/1yrkrTpu1SVGovxgOlNMx+lDJi/kIjIXU5gTtCITdgtO5sWRsxrJaUN8T
	 2/cMQ83QCKQmDBYiJ4wX8Wyqfh/x/XHgdGFHKzAbFpQkzKSZKVRbMo0I5WPc/iGRqk
	 DEq/qoEROy1HWLfiSrr46kuFLArLOh8A2BMISiqJ8bCN3t+rtTW2qNNZd4Y/CFLxvO
	 qjGOlozN4bTDQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b015532f7bso903671e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 15:10:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoJzLCe9oo6ryjHOy71sCnlsA9z2R71hitUaLBTc56b8f+Whmk0suuL8eoahoVuF1sSH1jXkbQ9C0zx@vger.kernel.org
X-Gm-Message-State: AOJu0YwENRkE4y1B2aYABQ7K2s4eGEfuoz3/s8fyxaN0KC5vYf79bX2w
	YaA1YLyq7t5RnDbhqeXk2tmy7SAYarsCqT5jiGe9KZO66xBM/jHFLwzyfEfyp9Mk0Q5aCg7NUDV
	+5zJlrVmj10mzIbTSnIR+Z/IVYR/Tef4=
X-Received: by 2002:ac2:454d:0:b0:5ae:a9eb:c5c2 with SMTP id
 2adb3069b0e04-5b2b2f7f6d0mr1389667e87.60.1784931005641; Fri, 24 Jul 2026
 15:10:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716210813.2582826-1-hugo@hugovil.com>
In-Reply-To: <20260716210813.2582826-1-hugo@hugovil.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 25 Jul 2026 00:09:53 +0200
X-Gmail-Original-Message-ID: <CAD++jLnzMEL5vauna86RgLWs1edcvE4YEddoBEZN9Gkc8XQzzw@mail.gmail.com>
X-Gm-Features: AUfX_mwJ19yURrtca8IRMTyQlGSAs9NA0_jacepCm48O-hgMI14ToQP2uAfi4_c
Message-ID: <CAD++jLnzMEL5vauna86RgLWs1edcvE4YEddoBEZN9Gkc8XQzzw@mail.gmail.com>
Subject: Re: [PATCH] serial: sc16is7xx: implement gpio get_direction() callback
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jon Ringle <jringle@gridpoint.com>, 
	Hugo Villeneuve <hvilleneuve@dimonoff.com>, stable@kernel.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2026 at 11:08=E2=80=AFPM Hugo Villeneuve <hugo@hugovil.com>=
 wrote:

> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
>
> It's strongly recommended for GPIO drivers to always implement the
> .get_direction() callback - even when the direction is tracked in
> software. The GPIO core emits a warning when the callback is missing
> and a user reads the direction of a line, e.g. via
> /sys/kernel/debug/gpio.
>
> Fixes: dfeae619d781 ("serial: sc16is7xx")
> Cc: stable@kernel.org
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
