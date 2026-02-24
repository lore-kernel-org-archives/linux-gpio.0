Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AAB36829D
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 08:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771923146; cv=none; b=Jwwvh8t8xWxbopDOrAQS6CPgTar0xFzdfKAlG4da4B2fHxqTBQ88E9cZ5X7b8St8w8G4jl2yYwLqDMufX3wOgrRxwH/6cigeBBD+UIBfv6cKqQRieTZA9KurhwLsqtrquW3p8MU+QRjZO/LWjhXqRa83HhsoNqFDMYyozOzZuDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771923146; c=relaxed/simple;
	bh=ZyS0H8QHSpm79D9MEZf7/yBV87yLDH23GUMf+3RQhgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r9SLObLE6vR4FMfglYzryoR/eBTMrc2c7X6Upjwodggjasx+KsdE2bpMrI0kzecXM/RudKwEoX+1TA89rKV/5nBjKEaFnGel7otbYYWHfzqwHMkIpwYEybrlM88MDrts9Co/CfZO0BMiluDxg/BQAZwgX3LWc/UUonqkluslLGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bdZLfJFY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bdZLfJFY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F80C4AF0C
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 08:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771923146;
	bh=ZyS0H8QHSpm79D9MEZf7/yBV87yLDH23GUMf+3RQhgw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bdZLfJFYe8+5f4w5dXjUq9zEPQylxyYsRi7aQI4Yxc5juIhLOBp520VtFeA83PFJd
	 GVwiB9H4EWldl8WbHU250eVz8ODEGFRMNYw3ewblcpqchUwYmA1q8k3cjpydaXVyDm
	 NRMlWc7PSCLznKCKUKrQzEP37Nm8pTMwxIEiffhvLab5Wq1Ve/rRm1hO+XNvR0NLy0
	 chmQteHW114LSglO1tBEG6GRYYM2Z/vyWAjDvtimBlq1J5xHBpv1a0bt3yGAiEL7nN
	 qjshPEk7p4V9BEel6nsvxOaSZVKi5VOFQFXkpwWOBYSHYVpi+TUXff+LhqfX0wILo3
	 S8Z1JbBSNq0Jw==
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7947cf097c1so48402697b3.2
        for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 00:52:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXCvENN8V8PkNt5TdNcYh86wjegIAbe7xlFtH2w9tMAPfm3yKRz1wux7xnEQ/VQFwVn/AYGiXdG5n+i@vger.kernel.org
X-Gm-Message-State: AOJu0YwlcYlg+f/Ept2UIKgaQpm80bHzvmGMSOjzd91pwI7ms+E3LFZH
	XUHrBdogxs4ZyJ8i1kk3kXMqsalB56eWspBWZ7NLXvyb3CepSKUoEKcO/0wpGzdjVTgKwwQDr0r
	jr/vyRTqMNuR1G7j59f9FCbuAJyUK7N8=
X-Received: by 2002:a05:690c:6d12:b0:796:55b1:a141 with SMTP id
 00721157ae682-798291429d7mr103365377b3.55.1771923146101; Tue, 24 Feb 2026
 00:52:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216085838.71518-3-krzysztof.kozlowski@oss.qualcomm.com> <20260216085838.71518-4-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260216085838.71518-4-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Feb 2026 09:52:15 +0100
X-Gmail-Original-Message-ID: <CAD++jLnBNSMC2i2JSZaB1bYuJxScjNNB1A46hQbcxoJ1wzP4PQ@mail.gmail.com>
X-Gm-Features: AaiRm535ELoqE6GjQBWumJZZYU3O-QZV3s4JmiiXSufeK5gb-Em4xaITPZHJBsA
Message-ID: <CAD++jLnBNSMC2i2JSZaB1bYuJxScjNNB1A46hQbcxoJ1wzP4PQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: cix: sky1: Unexport sky1_pinctrl_pm_ops
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Peter Chen <peter.chen@cixtech.com>, Fugang Duan <fugang.duan@cixtech.com>, 
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 16, 2026 at 9:58=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> File-scope 'sky1_pinctrl_pm_ops' is not used outside of this unit (and
> it should not be!), so unexport it and make it static to silence sparse
> warning:
>
>   pinctrl-sky1.c:525:25: warning: symbol 'sky1_pinctrl_pm_ops' was not de=
clared. Should it be static?
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Patch applied!

Yours,
Linus Walleij
