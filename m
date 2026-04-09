Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4ABD3876A9
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 08:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775721601; cv=none; b=QfhrnoXSVUNnDdTQAtxQflPKOspOxBYgXfePKl6ZEF2MRP3j3kjZcVLzuFPAu0t+aGTBWmG5mGeCTROVqguMauuL+AWJI3+MCH4jh8+70lBrIleW727+GzSS7V54OPZIIIg5WzWV8CSz97lK5rgHT0phzc9VSqDN/89AFXvK05s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775721601; c=relaxed/simple;
	bh=josDUjqMelZ/2LBMGfvaFfN3TmKDlC13I5MLpF4fjmA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dVi6//MI+o/wxbb91tsgardX7WvFKr360G9DZHBNMfEVVlMWWOu4oAg8ZtkRxq/XXFOdeB9lSum+pbQ3WcHaMuBhSFRZdxw29EQwcbaFA+YPXpaxXfwidwBmCCQgoNy7wiMVAV13DckNRo4otTu+0EWZ9Gt0tLpMVpdGeNHnBiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PoMRe5Jy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PoMRe5Jy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82FD1C2BCAF
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 08:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775721601;
	bh=josDUjqMelZ/2LBMGfvaFfN3TmKDlC13I5MLpF4fjmA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PoMRe5JyveST97xbiN4xnCUxD3Dw49aIfON6x9Bnuj6iWCKVP1w0Dkt+sAPcwS2g+
	 3NvdM8JXxJ72/o1CBWdBiJG7F/zfOd0TP1V+4b4ZC9ZMDC9I+X5ufkZFt6nrwEiY5O
	 cUSPmVShUPaqvZEZFVxEWVS/tiudqs5hQJrkk7CDxiUNIvI7pnK6O0oc4WhVQqHyp9
	 GYY7kSMjJliyo+W166uJ3GFhIxpyEmkgqwu3GmdqeyZCPVOzMVFKF3qQ5bI+iKQ5fV
	 BU/SZZ4baysZpo8SN//YgJJy4MbTtVc8vwpd8WE/dxcx2O7dI/mQIyeX84lZcJw/an
	 TDVfgh7lvlnQQ==
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-65075c2ba66so653755d50.1
        for <linux-gpio@vger.kernel.org>; Thu, 09 Apr 2026 01:00:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU7mXv3tdkh3bbFt4Ii0lqisLjKbvGudvrqk2ayByZ/AgWUzjnv7pmeODOauzOqZxbWwpR27MnA84zD@vger.kernel.org
X-Gm-Message-State: AOJu0YzkpAGavnSHUxXeitvM9qAuPEPF5bqNIu9MxkfETjsRpQub2Eq2
	otFpamVsm9lvLDaT3DKRPYg7SecuGkdMZZE+cffs5MjY/e2zyoOA+vvtLClCmwDdqKhquC3Xgrg
	LIVIbwzkgT9w9SybAPBTdupO6zHwZkw4=
X-Received: by 2002:a05:690e:429a:20b0:650:21bd:e0e7 with SMTP id
 956f58d0204a3-6518773ab08mr1807512d50.44.1775721600278; Thu, 09 Apr 2026
 01:00:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260407184805.807328-1-dev-josejavier.rodriguez@duagon.com> <20260407184805.807328-3-dev-josejavier.rodriguez@duagon.com>
In-Reply-To: <20260407184805.807328-3-dev-josejavier.rodriguez@duagon.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 9 Apr 2026 09:59:49 +0200
X-Gmail-Original-Message-ID: <CAD++jLkdTTkuZwi28BDVpK69DvxRc+hCzn6yq=SMRhWa19qc2Q@mail.gmail.com>
X-Gm-Features: AQROBzAYrd0AsQ4w1IJSpteGXAdsiD8DmyUvywI8ZlGoJHL86v-ez21sj-ulA2M
Message-ID: <CAD++jLkdTTkuZwi28BDVpK69DvxRc+hCzn6yq=SMRhWa19qc2Q@mail.gmail.com>
Subject: Re: [RFC PATCH 2/5] gpio: generic: extend gpio_generic_chip_config
 with PMIO register fields
To: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jose,

thanks for your patch!

On Tue, Apr 7, 2026 at 8:49=E2=80=AFPM Jose Javier Rodriguez Barbarin
<dev-josejavier.rodriguez@duagon.com> wrote:

> Instead of replacing the register type with gpio_chip_reg, it is better
> to extend the structure by adding dedicated fields for I/O port
> registers.
>
> This ensures compatibility with memory-mapped devices.
>
> Signed-off-by: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@d=
uagon.com>
(...)
> @@ -54,6 +59,11 @@ struct gpio_generic_chip_config {
>         void __iomem *clr;
>         void __iomem *dirout;
>         void __iomem *dirin;
> +       unsigned long dat_port;
> +       unsigned long set_port;
> +       unsigned long clr_port;
> +       unsigned long dirout_port;
> +       unsigned long dirin_port;

Isn't it easier to just create a new config type?

struct gpio_generic_port_chip_config { ... }?

It's only three more entries apart from this that will be duplicate.

This is only used during config anyway so it should be fine I think.

Yours,
Linus Walleij
