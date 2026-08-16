Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76ABD391E5F
	for <linux-gpio@vger.kernel.org>; Sun, 16 Aug 2026 17:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786899693; cv=none; b=AbZ9MFV2DHxxwDswBNsjE1Js1DpUtK2rDuBrzh5rknrB2Y3j9Csz/nBqYVJdYUv1TVVJv075w76s/OcTUcq1gWzeG+/UqeqkFssMrjoV8HZLPE6pIO7Vmuo/3CpHicsjCyKzT8C8voe4cWrjb2KjMQuuW6Lm9hR5ySGvAm7yDxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786899693; c=relaxed/simple;
	bh=crJasNktXQU5iuyj/fmwLncSQ4YBGQ1SNM6ReBOEaAM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EQAT1n2cm4PZUA7m7achnzEvMyMC0He3I1RxXhk7AmNDIvjBblPS/2CCg627xqjdy4DmdUh+0+Hzjn7P8ibJ0vopxMTHo7/3zeo5AsoINBuj6cIqEzJvZqy2jEwAi4WpuKTqARkg3fWox/Xxz3/fTAZKqsc4lH9ueqiBU6TOOH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tw47bP+m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tw47bP+m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 371961F00ACA
	for <linux-gpio@vger.kernel.org>; Sun, 16 Aug 2026 17:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786899692;
	bh=crJasNktXQU5iuyj/fmwLncSQ4YBGQ1SNM6ReBOEaAM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Tw47bP+m5+wtDQSthRr8map2Zr9RLLf4Ce6fT7F+Ac6OsPAf8v7705xCkSuEpLY9J
	 G7vrb05jM8/+dpWz96sLqSDj7xrEtW2Jy65MFymvGzpxuVQkKi+oTL39CO1UzqJB6o
	 fw7bqCDDdi0ZPPWv0G4HgSVvhK584NhTJvwrgySKEoM1omAeuhX4mubW+X+/OhtXN9
	 oHVu/LlurYDeO+dzeo61O7hfFVtNBwmVH/q9QBJxQrdy+qU9MYANL7TOOg9JVOFUPs
	 kWhp2uwqo3RAvTcmz3Fih17dPj5LN2frrMKo89hmh6e86vPmF2ymz0rCU4qsyvkzir
	 n6SqDu6AJ+ZbA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aeb2bc82ccso2994738e87.2
        for <linux-gpio@vger.kernel.org>; Sun, 16 Aug 2026 10:01:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqlGC1hFOLAvaSrdxfDvrajukhO2ovQhqJ+aaJcyLJ83nCVvOs2RomLDPIS3XADqP0V8Dycnq9Mmxhx@vger.kernel.org
X-Gm-Message-State: AOJu0YzFbBrDemgszkUGcYhKHIYx+Lr2PC1dEaflgidboBzwz+i0vo36
	deyN2fAz7AtjJPs9TSTBzxsfbnCcEqzSOciPFSK+RqVE08+aNC3KEWTcq8ry8WKp4GiGhj+tjLL
	2NeEyXd4GcE3NGtIayjiM2wx1xqY36pw=
X-Received: by 2002:a05:6512:32d6:b0:5b1:5d7f:84d8 with SMTP id
 2adb3069b0e04-5b459148a45mr2721300e87.46.1786899690974; Sun, 16 Aug 2026
 10:01:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813083200.10387-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260813083200.10387-1-bartosz.golaszewski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 16 Aug 2026 19:01:18 +0200
X-Gmail-Original-Message-ID: <CAD++jLkrhouz_nyKCv5JJaqUMeGt+EseawmjVmnkF58a-=A4iw@mail.gmail.com>
X-Gm-Features: AcwNN1XzzWU7aMEVytDPAju6L9eV8jNF3LzV2HraABi5_wX6qNjX2Nih9qs8s_0
Message-ID: <CAD++jLkrhouz_nyKCv5JJaqUMeGt+EseawmjVmnkF58a-=A4iw@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm pinctrl fixes for v7.2
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 10:32=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> Please pull the final one-liner fix for Qualcomm pin control drivers for
> this cycle.

This didn't make it to 7.2, sorry :(

I put it underneath the second pull request for 7.3 so it goes
upstream in the merge window.

Yours,
Linus Walleij
