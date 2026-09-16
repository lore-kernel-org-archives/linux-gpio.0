Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46784F6493
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 13:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789564912; cv=none; b=pJLYrGJhOVwSHwhVJdNcgxCBLpgBaJjsp5SK2g5jVJ5ha4qDSEDpwlo9ULTRaM323OUZu/uDvX57D3KDBzxjXCL1rbqYaOrUfgFh6/f6sOTGuzaelhOLw303bAiDXJ2jW81N2rRxCG2LTv5IrNIMjnGDrh+xIqAmoqZHufY2VWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789564912; c=relaxed/simple;
	bh=LoAF8Un9d1MzpIm7nHgSZ11oIbJfR+68cK5tUNKEllc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AbF7DsnZP5RAxUNfM0BuAINi/pyfPkTEQzqTWjRI7FePGbNa35i85xknYlTRJWsSeGIhJ6on9iuJC4Dri3GvOkaHEa66xBS+XDcoUOVw8mDNDGuzq4VdtJPQRfrfMfsy5NzhxKiR4sK3PomCVdAnDON2qOOAIZvYkhm7sskmLXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=km321WLz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="km321WLz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A02571F0089A
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 13:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789564909;
	bh=9ubbqQ2iB10rGBdoO3Svw7T5tJwvgFmsSmZq/yCqK/Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=km321WLzzHyls9sxQEghrtdim+/Y/mD/Cbc1rMcn9s5lw9yHfBVNNFFGKDwxsu4pP
	 0l4YhHqLSkr6CRviA0/nRJlSpAIz65UIwt3hy6iVUnSAbCmUNgU3Xo7th4MzA6FOxP
	 6B0yXahgMgJn7DhVzsrzv16m5NUvB+EHa4aNMaeNI2G7Y0gKBzcobi3XUnwU5G1IiO
	 xxgktVnShsU6CnFDn1d86WQhgZSsCuKP9pA1mGmDeJ2uMbO6rkMcwXrzQdTWQGjYqh
	 FSQbFNcDT7B1IE4f2/b/W69rtWZdFlE0w/z7c/yvm24YVZGvxjQ4aUpLibS5f8+s3b
	 x9xoX9OOJL5fw==
Received: by mail-lr2-f30.google.com with SMTP id 38308e7fff4ca-3a318299b38so8487501fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 06:21:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz2CwFC97yT0vMFDoWf7SVnCwXkm+c6xiyOKPXL7w8pVe151S108CWRJKKKWeFqYhBp51Zwz6QjaLCc@vger.kernel.org
X-Gm-Message-State: AFuF++mmlN3E8tFG7+qUoNv4yowcKZHsTfjj75D+jA8f7OJVEk61a/dh
	HDn7Lct99Z74AKzKHLUzNGXw0rlYydIvi0QcWDLExT3kO23Z8g3+C1STsTmRe3I1+zgKazqncsu
	hONo/aYXnvhX/otSsSLVFwm9x79ifHYY=
X-Received: by 2002:a05:6512:3b2a:b0:5b7:6568:3039 with SMTP id
 2adb3069b0e04-5b8b665e8cemr751267e87.60.1789564908290; Wed, 16 Sep 2026
 06:21:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904123300.36778-1-hemanth.selam@gmail.com> <20260904123300.36778-2-hemanth.selam@gmail.com>
In-Reply-To: <20260904123300.36778-2-hemanth.selam@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 15:21:36 +0200
X-Gmail-Original-Message-ID: <CAD++jLnaygOq04Nq=GVEoeQUBmODxteKzeQb7Zy910Jkf2c5Tg@mail.gmail.com>
X-Gm-Features: AcwNN1V9RDrjA4DEzm9jSbGNXjjK-Vlq7xZKmf757u08wUHaWSwZ2dAMEx9qn0I
Message-ID: <CAD++jLnaygOq04Nq=GVEoeQUBmODxteKzeQb7Zy910Jkf2c5Tg@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: fix typos in comments
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 2:33=E2=80=AFPM Hemanth Selam <hemanth.selam@gmail.c=
om> wrote:

> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
>
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Patches applied. Assisted tags changed to LLM.

Yours,
Linus Walleij
