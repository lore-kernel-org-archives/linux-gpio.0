Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074C73AFD0F
	for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2026 13:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782307717; cv=none; b=ZslTz6FHQzQkjUWFsIdTNo7vAHbh4MTpk8eT5vXOMfuSzrbTtsN4AuRxY8NwIpx9S9B6xexo+Sgk79626tW4gF90MMuWPGTVt2GlhbNfdYheqA392IYCRQCECyKXjc6kXP/c8HfexMfDMSaiSwA/v+nvzNwIaL2mN3K3S1dxD7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782307717; c=relaxed/simple;
	bh=MILPATqKbeqb1lE+ic/mzg4FWYtwrdaIRq/bUN9Xtzw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K2lAEpyVyWh5gVES3vaQ78DSjSX8WbjB6ShF0sM76Mjx/qv1vf+S5Nx9WMvuL46+pzzU7kS7pN4i1RDx/qGwjBU40RG/aJ9D9qcrjs/192L/skbzJricODzQ9Qck9hW9ybki/6oWGlA3WrzEUOUB30byWkxcPy1fxPkc8XgtRME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ho3RQR0a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ho3RQR0a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B19A51F00A3D
	for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2026 13:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782307716;
	bh=MILPATqKbeqb1lE+ic/mzg4FWYtwrdaIRq/bUN9Xtzw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ho3RQR0aFulrcRdOmcpBev8S+Yy9Ih3bGY5AhBO2dWIZHmAwMyjQObp+K95X35MWK
	 sIjkgZ9PMo1AFFI0a/c/9X+WBD1ucHprTh0slgEwUpXoVUN/LIOG21tp9EflDD3iIF
	 OLCsNxQPve9I+tM+heLvy92ENNvoExlKbsVDNpSrEZ5nhr8T6kUs0UV01YWl+Vx8OX
	 EsPyfr1cZWRDQLwc1cN7FUkktd7/ZOJnzeeKMZ2D5Sjkx2VWHP2xKa6TJfo8r2RKS2
	 fUpke4aM2lstEeyI4U0UfAHc0k5or1f+QjHrjCPcqeF8w0fKI3vqsZr1kzmng+TO5d
	 kvyT4V+zg/0ag==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5ad4c0c94fbso1106094e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2026 06:28:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqFDwuy2g46oQamnPyA4gdx5j9E6m+88jwRJhxhj9S424WpAjWT5AE9x1HUSZn4CtyuNE1wiyVXiOg6@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2gj0aGCtHN5jOWLJ0fwg4eymLfNNRVWtfHFMuyjSrjc1WQaoc
	8DJ+JzjOOYLCEVdsyO+BZWnKK0l8WQdVJqpjnprG1adh8jvEVLMaXviRPiOV/7defD5dV8l+A6C
	0EbPZgFylv3d/xQst1njfxNpB1fIY0QU=
X-Received: by 2002:ac2:4f07:0:b0:5ad:56a7:770f with SMTP id
 2adb3069b0e04-5ae9d555752mr927355e87.17.1782307715489; Wed, 24 Jun 2026
 06:28:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610-tlmm_test_changes-v2-1-f34536da4717@oss.qualcomm.com>
In-Reply-To: <20260610-tlmm_test_changes-v2-1-f34536da4717@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 24 Jun 2026 15:28:21 +0200
X-Gmail-Original-Message-ID: <CAD++jLnULAXykcZ9NMT6M59TEombGFG_uQw1mfiTAOCQZSQYbg@mail.gmail.com>
X-Gm-Features: AVVi8Cc0QQq2BEtTucwtdgAhhFjGNFRJ4LMjNcmtfAb-mLkDRwm8LUbdJSrKVPI
Message-ID: <CAD++jLnULAXykcZ9NMT6M59TEombGFG_uQw1mfiTAOCQZSQYbg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: Avoid assigning unused private context
 in test cases
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Yuanjie Yang <quic_yuanjiey@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 8:17=E2=80=AFAM Sneh Mankad
<sneh.mankad@oss.qualcomm.com> wrote:

> tlmm_test_rising_while_disabled() sets thread_op_remain to 10, but this
> variable is only used by the threaded IRQ handler to control the number
> of GPIO pin toggles. Since tlmm_test_rising_while_disabled() does not
> register a threaded IRQ handler, the assignment is never used.
>
> Similarly, tlmm_test_high() and tlmm_test_low() set intr_op_remain to 9,
> but the variable is used to denote the IRQ handler the number of times
> GPIO signal has to be toggled from the hard IRQ handler.
>
> Since tlmm_test_high() and tlmm_test_low() themselves toggle the
> signal and do not require the hard IRQ handler to do it, the assignment i=
s
> never used.
>
> Remove the thread_op_remain assignment from
> tlmm_test_rising_while_disabled() and intr_op_remain assignment from
> tlmm_test_high() and tlmm_test_low() test cases.
>
> This does not cause any change in functionality.
>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>

I don't understand this patch, qcom pinctrl maintainer Bartosz will
decide about it.

Yours,
Linus Walleij
