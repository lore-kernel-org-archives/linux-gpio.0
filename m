Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB15346E4E
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 12:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777985795; cv=none; b=Bwtzptmk4KE9VSFjztjOjppTm96M6oXL2obAw2Nxy0c3sd4M6x6x3+fCgTDDT4FLRuhaz6TqR5uf/6ZT1hGm+r07967ueBXMrpIfuZLfN8x68fp3EqFI0wb2vvNn0Clg2g2YHwXjkmAF+V68tSEv3JqTyecY2vOQStf/OzlfSYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777985795; c=relaxed/simple;
	bh=ZUs4wo3g3+7GpdmJ7ncT0CXa7bmF1VEsrvwglg4jLoE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hmhcb4r70LfmluyyJHBXoAqWydAKoudAHhr5LSdvfCjFBTLUu01GGm94fRs1ms8VUR49uU3v0Znwtff2F5HZR/OGPfXFZ4s17T39e+iWJJim/TuaDi+BxObNd7p00p3JYn+KjPiZochNNcY9lBI3+VKzdK0w4/2kvsPbDapIIm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hzodQ2NC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hzodQ2NC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98817C2BCC7
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 12:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777985795;
	bh=ZUs4wo3g3+7GpdmJ7ncT0CXa7bmF1VEsrvwglg4jLoE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hzodQ2NCG9zoh2XqXyjZl5yyYhCcjuWCm9xc/oDTNJN1WJLwwL4HFEEMw9c8vQxSB
	 //Xl5vKkviuGByHP5wUr5ppSPYKuYFZ9OO0iUFN3H3myUY7ktL+tolifDlitP26ngm
	 P2Ng3zfyVql6y1Oc8dn9tQA25C4f7gJ1V3P6lr+Dy5b8QDs61od9yKdadTwEqofx7E
	 Iux2b2dydeMXEVmqSYTJjk9HGstHpKXAO8vFfXpOiEYdHQ91v0SIZi5qVgvaVmyMys
	 EbFAso9I0L52rHJC+2erRMZ8fQaDgGu0r7ZbzddawxTG6n08oAPfF2l+Dt5FJRIgUN
	 IED1yLyvleX7A==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3937014be0cso31957061fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 05:56:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8bpwy2SKDSPgl0IXKjcjf6uvBlhJTyqt3zum0faxAH/i43sBHxMR8N0swOq0xHpt+5yKJJUkvxuJn/@vger.kernel.org
X-Gm-Message-State: AOJu0YxDU9xqrLj2D4ZI0gg2AOQreF7qjuf42OQx1IIZFMpYbYu8+WPK
	ojnaVg4kLIDfcibVtt/hnNrPMVFdDLfFKialShiCDlcYab2/Iwrx0wzyRJ8HHvLFIJHothqZ5GZ
	Ncsw0MdIhpIqzQbXPOFKC1i8p9ucnaFI=
X-Received: by 2002:a05:651c:324e:b0:38e:aeab:9ba6 with SMTP id
 38308e7fff4ca-3937850065bmr44277651fa.24.1777985794358; Tue, 05 May 2026
 05:56:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505094321.75040-3-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260505094321.75040-3-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 14:56:23 +0200
X-Gmail-Original-Message-ID: <CAD++jLmzzcp+CUKmr6-WLcDmB2zaOki_DTkvADOQ6V-1g710HA@mail.gmail.com>
X-Gm-Features: AVHnY4L5pGyidj4m0uJSds10p3ObB3yt2OdQMJ_NihpEGQGZ3UJKnYpGnOY1ZG8
Message-ID: <CAD++jLmzzcp+CUKmr6-WLcDmB2zaOki_DTkvADOQ6V-1g710HA@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: bcm: Move MODULE_DEVICE_TABLE next to the
 table itself
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 5, 2026 at 11:43=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> By convention MODULE_DEVICE_TABLE() immediately follows the ID table it
> exports, because this is easier to read and verify.  It also makes more
> sense since #ifdef for ACPI or OF could hide both of them.
>
> Most of the pin controller drivers already have this correctly placed,
> so adjust the other drivers.  No functional impact.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Patch applied.

Yours,
Linus Walleij
