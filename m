Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A704D39183A
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 08:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775724959; cv=none; b=FMAihDWt5pE2ZnXNrCGqcsebYc2Gfoj5wz2a0REKSI1/cTLrP4mr5VEbYRK1zkFPS+b8wUyKma5J8ngwiKyi3IGkwJqbMkF8PFTEe1MZp9J79ybRN8aCfZgDnbwS9a49fOPkQcarEyzNFPCDzSK++kXgqkNiTzVq00hUi42j2cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775724959; c=relaxed/simple;
	bh=NF3CUyvqEslN3aObPGJxyj9WcwsImXGdgGhPpcpwHTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KabGXZ1SFs0eBOjC9+WwuVSmBKtSeAwxStqffBf9trRYEPQJKaY9cVz4TPEex46lyLKtRuFV1AB0foFgD/I1XX8TxivcbDLC5ZD4MEmEgsqNqiLmnLmmEdBnrAkl1G4cfjUxsbo3rDdbTdalrd1b04eYl2AWqgHVPQhg3NtQTKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r+I0iEqe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r+I0iEqe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE5C3C2BCB1
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 08:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775724958;
	bh=NF3CUyvqEslN3aObPGJxyj9WcwsImXGdgGhPpcpwHTM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=r+I0iEqefF3AP0tMNA2d+KcJ64kOSTnPrpggsB+Yb1LDIp1Cw5n9EIYVWFBZER3Mw
	 kRV8jQ6aefjOT4hMAS8c/qSK/TEBGNgcNAFYO5I46T6pfAI6am6AN3ti+5yigGFV6i
	 /KFZU3GCCIivKlJQHSBD5wqHdxP2m59vwGZ6s+R0DjNBG0kI9ZXpeNJNzJL5coXvB4
	 8pFPq4os3cSwP9nTIBIk2ZCVh28IW1Djf+EOXE1mDiqxphQmmBrMVPhsJTbH/E23m2
	 olrotCjqKixmWwdNvad4FqdFqh3cH34s1Olasu08+Wn7w99TdOKO8WCuym5+tQCXv5
	 m4ZY2CZfH/Pbg==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7a17bc5745eso5966837b3.1
        for <linux-gpio@vger.kernel.org>; Thu, 09 Apr 2026 01:55:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW858d4TB/MZdA5c366krZplABFMus2SyAvvcXK7oIPCU5yMnBWwQj/JEaAdxbhZWThxrh6uJIzjPfJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzRcZeMqgoCHdYlMiRZ68BZxu8ZrtTOQSqshUPaun09gTY5cz8V
	monSqTufm8zsf6FAS/rJdym62KrW5IPvvLoCS887BrtTc1M2O9i+swybbkfFJ1UJXp5U1Z0LZCq
	tyfJldOgFeZemt7gzyHUYFZO+q9AJZVU=
X-Received: by 2002:a05:690c:81:b0:798:cf16:1c6e with SMTP id
 00721157ae682-7a4d3bd7d7amr243494517b3.21.1775724958284; Thu, 09 Apr 2026
 01:55:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260406-eliza_pinctrl-v1-1-52fbf0ebc56c@oss.qualcomm.com>
In-Reply-To: <20260406-eliza_pinctrl-v1-1-52fbf0ebc56c@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 9 Apr 2026 10:55:46 +0200
X-Gmail-Original-Message-ID: <CAD++jLkLQMLOhhZ54ifV0YdXdGp1yg5ReF2gHQUBsEiDF6M5=g@mail.gmail.com>
X-Gm-Features: AQROBzBjsuKMpK23woKhjFABPMxI28LWUeRVpLvhrEIc36GbEsp1oRKa401QDyI
Message-ID: <CAD++jLkLQMLOhhZ54ifV0YdXdGp1yg5ReF2gHQUBsEiDF6M5=g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Remove unused macro definitions
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 5, 2026 at 8:34=E2=80=AFPM Maulik Shah <maulik.shah@oss.qualcom=
m.com> wrote:

> Remove SDC_QDSD_PINGROUP, QUP_I3C and UFS_RESET macros as on some
> platforms they are unused.
>
> No functional impact.
>
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

This does not apply to my pinctrl tree.

Since it's just cleanup, please hold this off until v7.1-rc1, then rebase
and resend it and I will apply it.

Yours,
Linus Walleij
