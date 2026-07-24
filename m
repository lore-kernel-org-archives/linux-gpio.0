Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66B7374730
	for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 21:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784929359; cv=none; b=khDyvowOVpq5uK6eJE11M//GESD27dOIkF9JHjM2i+/2KFD3bohCv+UxVVmOctleV6afTtVFrr5/xd0P8sEdDcYZzqoSmaDo/NUOJf2V+5r5XjuVpR6+3zs+Jci3hA9HcZByLIXlQ0NZnGm5fSIYpPVZoXW2qygV3OHmPdBrb5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784929359; c=relaxed/simple;
	bh=93nTlan20S4ZihF1TH03SELRvajigVT1UCol5rzVHVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jzR5LegFd5CE/hb95A+EjBtxE4PPnYtMIJEeZz40SM2wC4ISE3p0EEKfLuO9r9scY+HPDRX1pxwWhplxnQ68I6XyBkCMvWSMvadQm680787LCi/LdI1UAX7SIcvtaSTxCCR9f6VzXTRbvqysHVTsOZa0Z+LuQ1YoK6O+Aod+XP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hEmFc/BK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hEmFc/BK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E49E1F000E9
	for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 21:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784929358;
	bh=93nTlan20S4ZihF1TH03SELRvajigVT1UCol5rzVHVw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hEmFc/BKUcWsumTk1RsZHe2NY8oeIaOBVSo4dNp3w0dwHVNdpDJD5gJKPwGFOqION
	 fM78StQHVRjoOcCnvpgdfPQwTk7Tlv8b4vkMviTvDgaxN6Pm18PKfXIvvUw8LCBRb5
	 zuD6utGJCTclkyaLo7+PlmV1csmHqInHt/91XwlxpwDy2LH44IW9X7KNyqmUsar9x/
	 /0qnVwXTx1ivWu+1zxl0n/P5Ol4Zfly4hwQ0XsgHkv1g62EXIwjb1+1dpiiNSGNiUr
	 GeRap6CnkekgkIUOdEvwQL1yzZdKBQqGQmqUOOmt5vBHbuC0XauT8b7+2q/v645YKb
	 6gwaKlT2io2FA==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b00d083818so1650211e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 14:42:38 -0700 (PDT)
X-Gm-Message-State: AOJu0YxS1Cgm1PKU+TDe2x/Tr49XJjAjRj7MUj+c52NFW7xYT3Z60+bY
	HmJ4rPjyLs55m4GGGLCD81u9Fn94PUoJ0RCi/edn1t/XCQDJ7ecuB/Y6JycVRm66TrT/+/zrxTI
	25apTYAgpy6NIZHkjiZlnh5OWrzmPOpk=
X-Received: by 2002:ac2:4f0c:0:b0:5ae:cf70:a1b2 with SMTP id
 2adb3069b0e04-5b2bcc1354bmr470886e87.21.1784929357410; Fri, 24 Jul 2026
 14:42:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715193546.2852108-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20260715193546.2852108-1-Frank.Li@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Jul 2026 23:42:25 +0200
X-Gmail-Original-Message-ID: <CAD++jLmZMNAt9pvohvuR-hMUaX+8WS2_Mg2P1c_Jz40TjbcnSQ@mail.gmail.com>
X-Gm-Features: AUfX_mwJ_N3tPLjNW1uS8P8WgWqtQe6NfLqreK4It94M8uGNKzXV0WX6KFCrlIc
Message-ID: <CAD++jLmZMNAt9pvohvuR-hMUaX+8WS2_Mg2P1c_Jz40TjbcnSQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] pinctrl: pinctrl-generic-mux: use mux_state_try_select()
To: Frank.Li@oss.nxp.com
Cc: "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 9:36=E2=80=AFPM <Frank.Li@oss.nxp.com> wrote:

> Use mux_state_try_select() instead of mux_state_select() so that the
> consumer driver does not block during probe when the mux state has
> already been selected.
>
> mux_state_try_select() returns -EBUSY if the requested state is already
> selected, allowing the driver to handle the condition without waiting.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Previous earily version pinctrl-generic-mux manage this resouce to avoid
> call mux_state_select(). But review or respin patch, remove these check.
> anyways mux_state_try_select() better method.

OK makes sense, patch applied!

Yours,
Linus Walleij
