Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9B035674C
	for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 22:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784930429; cv=none; b=sEuv7eSLu4njMw0w1hBKn6LTnzWfNx4ktQ5dKjLvLHfmn6T5mhjgiF0R1eY1iFVXJQMYlFIJuvUPcb3712WlXuNU+nz0ZJ6/wjZ5PD8RbWTR4rTfGuJpZcztGcK8JYqm7Vvs8P1a8xkFSFy9TCr/677Sjl15jqoHJ12hGi72hwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784930429; c=relaxed/simple;
	bh=ciurbXVG7tI+GxVWU3OIFmJA2VqTVB1aguW3w0pZ6WE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DMMxMNrKgAPTIy7/XnZc+uAzDQLWdrNxf2SYS6rpQhzlCaNA6fstrxmAylVvj5HFEWv5foW/dEZHtYIIVY8VnXyoYKakDeYB4Q29UPfWIGsH5OhnNMIfRSIthQzc/LtgHJP0HxUyxnCRptsfSd4whkwO7olupzqgVIkEfm2oU3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n/IuILDu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n/IuILDu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A00F31F00A3E
	for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 22:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784930427;
	bh=ciurbXVG7tI+GxVWU3OIFmJA2VqTVB1aguW3w0pZ6WE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=n/IuILDu+lvOuOI1AbxNCaPIbF2MNNdbsE4T1jaE65xUfYs9zdEVa5FU+2/dztBt6
	 Y7LmD+L5eAVvAYNRLg3mb8RMgAes8mLlOoSP4jzjPLF1kQ+qHcO3h4YwxdbiR/S25J
	 3NCXTEZUUo76k2F7YjCS4dTwUaqa3eb9P5QlbRD09btxJtzDJ7Sn71Ks0mLK/lx6E4
	 b7VFA1I3S9xnBbT1BGn+E6N3YhyBrpYQ/Kf5oQtG2X49nWjibx9wB8VZUyQvCY2eXE
	 /2+akqwHRI61C5wmSFMUqOZQNQC4Nt+W3eGsPGfgc9cxpo6lvyK9zPRYSkZUqbT9JW
	 wLQ3r9bzTQ93Q==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39c95395230so7975301fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 15:00:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrwTT0rV8BBcwv0xcnlPau9LrH3EsjziV1IKASkSKOnDdPopMoVB3BdhUcoZrSZWJZ0NJ+xkMyZhCsv@vger.kernel.org
X-Gm-Message-State: AOJu0YzfNs4sQwj/OjWKCqA/qzMj1RdNPAC7LTMMCoqvRGo3sRJFT6KA
	49WwY/Cx785XdSw10xHm9mn4VCR+8exi8orvda86osGS2mqjGmSU3l7I4QrzPlgXete/sihYLrK
	QLCB0IfRq/v6evJuO2pE7CgtzcWy7vpU=
X-Received: by 2002:a05:6512:144f:20b0:5b0:1685:e369 with SMTP id
 2adb3069b0e04-5b2b2f69b51mr1418525e87.42.1784930426435; Fri, 24 Jul 2026
 15:00:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424-pinctrl_irqchip_states-v1-1-85286f078916@oss.qualcomm.com>
In-Reply-To: <20260424-pinctrl_irqchip_states-v1-1-85286f078916@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 25 Jul 2026 00:00:14 +0200
X-Gmail-Original-Message-ID: <CAD++jLnQ1ZmRDZMA0DfAhuVSi2zhqKSrn-xRCNdrAcV4eT1jUg@mail.gmail.com>
X-Gm-Features: AUfX_mwCQaGPJnUAmt5Lw4bgTuDl8LcZ2_9ygrXHQMoldDRAoXRQYXi-6OKOdj8
Message-ID: <CAD++jLnQ1ZmRDZMA0DfAhuVSi2zhqKSrn-xRCNdrAcV4eT1jUg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Add irq_get/set_irqchip_state() for msm
 gpio irqchip
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2026 at 8:31=E2=80=AFAM Sneh Mankad
<sneh.mankad@oss.qualcomm.com> wrote:

> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
>
> MPM irqchip monitors the interrupts during SoC sleep state and after wake=
up
> replays the edge interrupt by making it pending at respective irqchip by
> invoking irq_set_irqchip_state() API. The msm gpio irqchip however do not
> implement this function making it impossible to replay the gpio interrupt
> on any MPM irqchip based SoC.
>
> Add the missing irq_get/set_irqchip_state() APIs. Implement only
> IRQCHIP_STATE_PENDING case which MPM irqchip uses.
>
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>

This needs to be queued by Bartosz now that he's maintaining
Qcom pinctrl.

FWIW
Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
