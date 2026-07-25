Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F473603DB
	for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 09:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784970746; cv=none; b=bq/R5znKfNx7AKytDZbNzwu2GgxN4VGtAJmgVGatwEYkJ2hPGeRpxb4Qb9BFmQhj6/U4jV2+iSSs9GQKY/gJDJEFjKZW6rmlDlvBsiFYyhgmx8F0tbEpv1Z7ILRBL9k1z1lYex1ipHnonlkMf37nexOIY1caymGD9TLAkQaerVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784970746; c=relaxed/simple;
	bh=m6BBJ3GLbmxFVKSMiL1kVy+o8xY654mZtc1zrW9hJzI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s+DkePLgL8X3fGSsVi5UMe/OJWz61IsffHQoCxX0KFzHRopq/exM0fPWjoeFdTqQQ8f1mcCRT69FXC9QLH1zFU2RKmVAuWGQSSemfL6f/6q2QsAfyyM4Opgnb1o0wlRozClnXW/qxWVLSyeDWlU0K6kou6rKInFCVGBYHVXsj+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S9mPcPfV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S9mPcPfV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B37191F000E9
	for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 09:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784970744;
	bh=m6BBJ3GLbmxFVKSMiL1kVy+o8xY654mZtc1zrW9hJzI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=S9mPcPfVd8c54cdBctzbSiTqJRhSJaHSzja3gbKrvm38w10bCAwejhWSeTBY6yAII
	 nYJoLD7toCS96CXhcI3UE0rBo69cJpycaoDMquPlgwrXhslSDYQj7oxllqXDlu7Szp
	 Uu8NuAXdgtWlIVyLNAmQuae7RsDIUk/4FgXXrlJDENp9qBuAKLIkPGtPae4VcHbOC6
	 xInWiRsri4Dr+LSDYpIOszX2rghfjYdunTW3zwYemVVv9r71xoYaJQwoqNgcRz/lIL
	 jDu4JXRsJNTguoARmBXW/j3HU6JUnmOm8CcEME8+USk2WoczwoPbc2EuyjmrftmdUQ
	 92xSEGbR7zO8Q==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39c7ef2b1e2so10365941fa.1
        for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 02:12:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq3s7Litz4/iR1m4iln9o2kUfAXE96JkZTHTxHFqRIfrEuevUyIJZZCUVDj6CcQILyxBH/Y3LTT57nR@vger.kernel.org
X-Gm-Message-State: AOJu0YzAvh0odDwhGoPi/wUZs5YQ0bfGt8zWdcnVfOLxsUNXWptvo41I
	QeR9oi1tziVCBhhuR1Hf02pptFIBc4ZQAPBkhpNRF3ZovPsMS3blexE85EbRlKMO+bL5C+Y2dd4
	yRvAgaqFvmXPxSQkpZ8G68td9W7QtsNI=
X-Received: by 2002:a05:6512:1088:b0:5b2:9c9d:6448 with SMTP id
 2adb3069b0e04-5b2c1afb516mr283288e87.12.1784970743549; Sat, 25 Jul 2026
 02:12:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260718041311.2605172-1-dmitry.torokhov@gmail.com> <20260718041311.2605172-4-dmitry.torokhov@gmail.com>
In-Reply-To: <20260718041311.2605172-4-dmitry.torokhov@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 25 Jul 2026 11:12:11 +0200
X-Gmail-Original-Message-ID: <CAD++jLnBpPtu3ZyCx2U1R0tAEe35RQVF_sveLNHpwhS+k=XE6Q@mail.gmail.com>
X-Gm-Features: AUfX_mz81WJLQwKmkarZzcKfQk7reNLO4iTlxlIGpZNwcDGtZfFkt8vLfBURbeM
Message-ID: <CAD++jLnBpPtu3ZyCx2U1R0tAEe35RQVF_sveLNHpwhS+k=XE6Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] gpiolib: of: clean up formatting to pass checkpatch
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 18, 2026 at 6:13=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> Clean up parameter alignment, line wrapping, and parenthesis formatting
> in drivers/gpio/gpiolib-of.c to make the module pass checkpatch --strict
> without warnings or checks. This helps when one has checkpach configured
> as a linter for their editor.
>
> Assisted-by: Antigravity:gemini-3.5-flash
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
