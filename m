Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441827;
	b=VoKKX+196X94ygVXSUQXEXUfTDvitCVqpfIAlyy49jRMsJd83alxN9WDw2sqHWfDSxB4
	 /YB+V3ppktU0upIAKfn5K5aY9jkULHufjGisC0X0RiLVxnAzBtlvQlnxa2CnsJZ1a+zgv
	 pU4jz7+ZRnh07pHhn6LUM1cxjRLDWhRqoSP/axi+J7RLNVpk3Yj604VGAuzfylfzV+sMy
	 yukNeClKxq45EVX6c4jRwBRH6S1gIMX6CCl1ZfU8V0Tgs/aU68ww3v8n9nATE/AbfHsbK
	 xHLmQbAk2H30VVN/DKj7iHZu+KNV5wlRXkb7vfY/IhA356vpKDSduBMuVkUaOHgkJkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441827;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zwVSvYFkSgVnLdrPSlQycgfZHzRjqVRKUpq6eL/vxSc=;
	b=vfXwTYdEh3aEFGSlzd738qlmPscMl2aJIOmwGgEmy4ruJwxtMtWNW5xDvEdHoH5CTfHj
	 6OGc2A1I9IivsYwbnjX10GIxL0sfrTEdBLyFsi+d8pcyXFfJmf05/togD7/S69W5Tmjg3
	 4IOfiJS1dDZiPeRTmxqmuDSk+GANdObJ8u4oHmpOybavtiJPVGyvHbAq5/O57SixhI7j7
	 sk8ABFv+nWKzdTDHZ8wQgR4mguLhc3B1TlbcZTpXCjYAFq4VxMte9PzLgQtyCbWN+c4iJ
	 b6bkgCaU7Wux4Q9CKrS04vAHxPqA5JfvBKq+vTTrwfUkq+BoWVRP3dQdHFwytkqZKvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OUIl9Heo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79A4606A31A
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 13:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OUIl9Heo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B8041F000D8
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 13:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795441827;
	bh=zwVSvYFkSgVnLdrPSlQycgfZHzRjqVRKUpq6eL/vxSc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OUIl9HeolUgHlmaLkcOiVE06pQMRlgXmWdgJEMvi9sW3be3i2uR38dSf3y11nXCXs
	 GvbwS3Y0z+8TwVgD2QznGJNxs98UhneDCsEEOp90KmshhHluaCeKIi1yhiuFKDPl4U
	 biqN3rcTh1hf+yTc/Sq8DITxrNGFWutP7dckOVhvvnDwV9oWwwRsSP9V0A+tJn5SbD
	 m+ChPATPV0rwFE71DK+W6TkD/YWqt/zl39leLC0t/4AM/JCqT0/VgMfScMVnCsPO72
	 /BMicY8R4J3ZrIXUyeDIb8+J4qfHmkDEhqPRffjRL5DJi9oG5mqjvInfJ7JEqR2Tsb
	 4Nb9WD3///l6w==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5be416e603cso2430790e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 05:50:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG1EVmg/5eUC6KD2yxCIxvXVc1BLxMyaLvpKEeMB9MEML7z2Z4oJ0AXfOoqiUbJNqF3updDYk8ZSbUA@vger.kernel.org
X-Gm-Message-State: APuU4Z9Nb/loNdBWVUNwt9LG+lAk3s12OUJo2CcdFM+hfgVwcLvUFXpQ
	Mf9Nj84wLp5P7oQ2qtF0sGTN2Om+iGW8M/iBxACNk67v8XVBm+Eqd8j87068fG7hLWdJ/bcsDI3
	8gmU+axarvIY41+brNnroY0vnf4TjZaA=
X-Received: by 2002:a05:6512:1241:b0:5c1:a403:628 with SMTP id
 2adb3069b0e04-5c1bc819550mr3138167e87.51.1795441826283; Mon, 23 Nov 2026
 05:50:26 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121174527.19690-1-ku.loong@gapp.nthu.edu.tw>
In-Reply-To: <20261121174527.19690-1-ku.loong@gapp.nthu.edu.tw>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Nov 2026 14:50:12 +0100
X-Gmail-Original-Message-ID: <CAD++jLkq3GOK=-HCXho+prJEnv_tzmqzGDaftP-P_47UqXD0HA@mail.gmail.com>
X-Gm-Features: Aa3M54rHdIamdzT_778YDJQlqcvu4tASR7Fn_vus4QlgHHMUgADXgMguOV-p1MU
Message-ID: <CAD++jLkq3GOK=-HCXho+prJEnv_tzmqzGDaftP-P_47UqXD0HA@mail.gmail.com>
Subject: Re: [PATCH] gpio: amdpt: Use __func__ instead of hardcoded function names
To: Chen Jung Ku <ku.loong@gapp.nthu.edu.tw>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 21, 2026 at 6:46=E2=80=AFPM Chen Jung Ku <ku.loong@gapp.nthu.ed=
u.tw> wrote:

> Replace hardcoded function names with __func__ in the dev_dbg()
> messages to fix checkpatch.pl warnings.
>
> No functional changes.
>
> Signed-off-by: Chen Jung Ku <ku.loong@gapp.nthu.edu.tw>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
