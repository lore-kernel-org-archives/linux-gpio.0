Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710E2359A81
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 07:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782201170; cv=none; b=r7lX9vZRZJq9VoQo340KB8h8YVXWL7uL6XgzIsyVj9Xrjgje9j6/w0NexPlMM0by231E8GoYrar3BRgFgJqoW23dytU/JhwPY5hzNjXI6qBhWB3F3nR5rl55lndJHsaaiIaCJ6okNOev/F8wf38+dS1OOnQtgdjgzw4jbs1sHrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782201170; c=relaxed/simple;
	bh=AfmCVy5Txrt3CeAZvYzW7mAjRq+/7/ecn7bO87qZmTk=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VW4zu47p0ve8Wp5HgvXtGyXc2iTOu+nLfDm+nNvORSzcBCHg0ULDSh7mc2BaUHMJJmvBiomxcAZFLmSFio5osw2V0YWqb5dQGZMG4y6VxEwPde5dwSX7/SFyOH47U87ct+uAK8B9lXZ422WwcYWWbg6N213g7HUUIZcR6sk5vYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R4PNThbm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R4PNThbm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54E2F1F00A3E
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 07:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782201169;
	bh=En92Xu5VLi1svHldSuzAI88prm+hCaPJPFR0YvxVC3E=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=R4PNThbmNppeCXkKfQ4G4iSn78iVwtE8eaGB2P62ksTdJgJNB1cRBNFTAX9AV2yI0
	 LOrZVeB2dFnEVQuwNWyHa6kYMDsDujBbnVUoplwZlWjapv+hKngWNWEzpTsPAx9ub7
	 thO/RVcGuUbK2E+d6WOuwTDUY20RquTCs9KZOQo6YdZP1tr489NPKpQ5LtwLLaykb4
	 LQ7KVT9NtnS3XtMI6uiNOm/Oluv5oMx/lMBo1yfmxfZ52MDsh9FCKvQOCjoQov1OMl
	 yMK7xPgcKoS81m4gik7VfR6nYx+mpOWf6MDIaom5ErKw3oZxxMALq4HC5G184+0F9z
	 GE2vrELuueXKw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5ad5e719157so2668655e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 00:52:49 -0700 (PDT)
X-Gm-Message-State: AOJu0YzNrKfXttP/HYa5N51j0W0CbAI+DFIUz86eXGwqZG39mhFM6l/N
	R0thfCbDl3Przsxw9lq0seTWAy3ndUCPoha1C6gR9YN1ycyrgs45cUQQ03BMW0cCiSDU0FFqx0P
	iSZiaRMEj273SwDCblrWR8M+ut0KRHswGBDjfE7711Q==
X-Received: by 2002:ac2:4e0a:0:b0:5aa:6d0f:d765 with SMTP id
 2adb3069b0e04-5ad576e95b6mr4857251e87.20.1782201167935; Tue, 23 Jun 2026
 00:52:47 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 03:52:46 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 03:52:46 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260622153137.69065-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622153137.69065-1-pengpeng@iscas.ac.cn>
Date: Tue, 23 Jun 2026 03:52:46 -0400
X-Gmail-Original-Message-ID: <CAMRc=Md4zrvAHxAy8e4scCQBtHrjDVYNiXO0uGaFxQk3gys4dw@mail.gmail.com>
X-Gm-Features: AVVi8Cf3fubtqg3XStMKPJDafJK8IM_c6i80RwcRlmbfv7nhnE48j-5Lxj3OFvU
Message-ID: <CAMRc=Md4zrvAHxAy8e4scCQBtHrjDVYNiXO0uGaFxQk3gys4dw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mvebu: fail probe if gpiochip registration fails
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Jun 2026 17:31:37 +0200, Pengpeng Hou <pengpeng@iscas.ac.cn> said:
> mvebu_gpio_probe() registers the GPIO chip with devm_gpiochip_add_data()
> but ignores the return value.  If registration fails, probe continues and
> leaves later code operating on a GPIO chip that was never published to
> gpiolib.
>
> Return the registration error so the device fails probe cleanly.
>
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---

Can you add the Fixes tag please?

Bart
