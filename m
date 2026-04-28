Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BD0243951
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 09:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368976; cv=none; b=WG7wFYMsd8hxM1zMRxDyKgymJIE6z0zw0ytHFwKttob/+VAmkaxQWGP45eE/gMXf79ZQVYYcJnaM2K/iSIRcjLMstpX40LxLVHB80197QcEjCL2opMDimDUid+Tntxvg74F+R+vl0KLRoCpDd+siNdSdE2ct4Kolx6VkOJl0PbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368976; c=relaxed/simple;
	bh=Q2IhJTHAuC1AUXT694Aka6EEu2Ra5aX3eEAoeQ3/L58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TLlwI5ZZyOxj6Xmwxg6BpkfplzPKlAd9XCoANXA6hro28ts1EhsiPRTILd6kiD7Z8kjSsMW3YZs9lU832pXm5zoOmzBF0ibHdHRsguqvGonTJ861l3g8rzUNBMMArbMsFFJJ8uZVKw/PJo7yxXCNeyj5itwoOBnRnK57dJ+vNPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hkf8udkc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hkf8udkc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94DE1C2BCAF
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 09:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777368976;
	bh=Q2IhJTHAuC1AUXT694Aka6EEu2Ra5aX3eEAoeQ3/L58=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hkf8udkcJ9pDoGKdTdODBX9okvmZW46aRLqAsYTpkBtG0vBhhMIa6uHLnlErWLvNY
	 ReOTJ3VVXKopkjBroPV0BPGRG6C4jljPXmF0jETV3nekZZiXbviCZUqpVFloYfeYw5
	 s7BJQp7PNO57kaM7ZROQtUUmXVs/cCmQ3d5hu3cBOYTTn11Vge52vSyIc1fW2d7xfZ
	 Qrco4h0dsZHqYh/H4dlrMQE501AmOroN28YRy/JbDq69XQ1zMHgzi0Lc3Pb7hRmQKF
	 2lRQ/OKgT9Dpvi7dfMrl3xgVBDqpzXNbPa/s+EhHwVysgt+U4Ja23gdsTn8QUqoOJp
	 plzh3imY0YCDg==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38e84ed22bdso105702931fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 02:36:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+Rn3iRcxbuk0dDtM68ySC3+Rcenx7YsOfeAhDRwC9GGtUgmJiz/bHJ4q9X+2w37fh+3LH0SoG0GWwN@vger.kernel.org
X-Gm-Message-State: AOJu0YxAAcPOLvQSQJM7qg9/O9AbyNAlNufoToYcFZIf7nfXADYhLaiw
	5IHB9u/AK1uMLe3bis/gzf4T/jiIvwclDqXMxgj6HXnmpAnJQGPAqJdfEs/qe5tdrQRrwcWBjGb
	85b43gBMx+AU1nRp0aTLaiNQ4K+6/Ki0=
X-Received: by 2002:a2e:9218:0:b0:38e:98b0:3a7e with SMTP id
 38308e7fff4ca-39240fc94edmr5214731fa.22.1777368975320; Tue, 28 Apr 2026
 02:36:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423-misc-eliza-pinctrl-v1-0-2498b365ff2c@pm.me> <20260423-misc-eliza-pinctrl-v1-2-2498b365ff2c@pm.me>
In-Reply-To: <20260423-misc-eliza-pinctrl-v1-2-2498b365ff2c@pm.me>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 28 Apr 2026 11:36:02 +0200
X-Gmail-Original-Message-ID: <CAD++jLk1TOwi4_=X-t0ebw9tB0oD6OD9-4j8UuzJZ7FDfY+S7g@mail.gmail.com>
X-Gm-Features: AVHnY4I2P6r0AE4a6jocyU9CkLCpVqv8N3WBBx2c2fr0tJivJQROa45r3-7KI8s
Message-ID: <CAD++jLk1TOwi4_=X-t0ebw9tB0oD6OD9-4j8UuzJZ7FDfY+S7g@mail.gmail.com>
Subject: Re: [PATCH RFC 2/2] pinctrl: qcom: eliza: Fix QDSS trace
 clock/control pingroup names
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2026 at 6:51=E2=80=AFAM Alexander Koskovich <akoskovich@pm.=
me> wrote:

> Fix a few typos for these in their respective pingroups, the groups
> already exist they just weren't referenced.
>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>

This patch 2/2 applied for fixes.

Yours,
Linus Walleij
