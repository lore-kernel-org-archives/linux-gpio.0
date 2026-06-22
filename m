Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6086238F64C
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 08:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782116001; cv=none; b=kGuJRxtAU8jafV1NqEOYzyV3NYy7IclAIX32fFG1J/cFuQ/yHqRE7IXgermF7YEhXWudlFcMQo6ZElaubo99vk/jSuNaudHnMl2emfLXNZtQbGQQp+LmYRUS8nitivsSV7A+/YJv05w4X2OOzTtqUIlylOadMxiy6pNAGbVa0cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782116001; c=relaxed/simple;
	bh=16gMpuqlil3yavO9XqNLt3WpOT1bGdWJhnebndJx6Ew=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=heq4DnfQBCRYjPwKgpDe2dbgOAYINnpVCQdbSR9TV3pU2iEuRI/f4Po/TjK1csOtqrJwlJ64WpXa3omZT1ZJbHeVZ05Xp6AnGTnI55jCovnIWPBmCy840M9J+qGdRFdnyrYBx0TIqFKVfKPg/x5E/AgNGBcJQdgxuDlabY3jOW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AiyWX2t9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AiyWX2t9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C4E01F00A3D
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 08:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782115999;
	bh=16gMpuqlil3yavO9XqNLt3WpOT1bGdWJhnebndJx6Ew=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=AiyWX2t9iyWK0LNLv98kwG4X9HcMRFqL/nAavncg3BwzuzudFXuzoMyekbdj+6G02
	 2Y0s+A0AYHCSDcckSfJN4v3FLd8j6LWmbxz3V7RIXZYzseEXqGIPXzNs6/V/w3AKxX
	 0ZREYGYmQNo8blNpd4HhjRzYDMCxrpJMZ0saMiNC5rB5uLL6V3Z5FKSVY2sVhUwq6l
	 9ygNWE6Y/zxq1k06ymuA86O91BQjHR051PknFXboSDkkLLG7prYyaA/SGsAB0i80l0
	 /SiXN7V4uOL2ym7dtySZbY2E3km+i/NQZjea7wN6WCNA1fDNl6eXkec6ZrROeAOoXn
	 lvV7KtrkixfkQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5ad49da7123so3431438e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 01:13:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8HRgzbIPVURmgd3GAikD5TF8jcBNmtvcN/iuuHyytINVQDURdjjJ1CqHp3GOauYi+f8Dqk5wgDOvh+@vger.kernel.org
X-Gm-Message-State: AOJu0YxDVfSPd8tXjkUXFwBox2nM2jvBsxN6ZzU3rplaRMHOPWz9QOw9
	Za10MAlrSvO1hxYxfklK2/9NVi84juXbagrwh8IzyIT1EHUnWx+KaJ/nCTkJVXVuIc1qKavFlIV
	+P+CwcMpooXF0xLsru/EQ+GnEAwd9sUW3f48hIVKVCg==
X-Received: by 2002:a05:6512:251e:b0:5ad:4a8d:cf29 with SMTP id
 2adb3069b0e04-5ad5721cc04mr3564002e87.12.1782115997751; Mon, 22 Jun 2026
 01:13:17 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Jun 2026 04:13:16 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Jun 2026 04:13:16 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260620-smaug-audio-v1-1-e318acdf5abd@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260620-smaug-audio-v1-0-e318acdf5abd@bootlin.com> <20260620-smaug-audio-v1-1-e318acdf5abd@bootlin.com>
Date: Mon, 22 Jun 2026 04:13:16 -0400
X-Gmail-Original-Message-ID: <CAMRc=MfSfKBpDgsW7ZuYHCkEu73s-oFOJUND4ziXH_TdG7ab7A@mail.gmail.com>
X-Gm-Features: AVVi8CdLrWdNhP6P3ebhd1l5V5oDEuKly30vQC5C1peaCrzu1asHfo7CiF05qxw
Message-ID: <CAMRc=MfSfKBpDgsW7ZuYHCkEu73s-oFOJUND4ziXH_TdG7ab7A@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: rt5677: Add GPIO .get_direction() callback
To: Diogo Ivo <diogo.ivo@bootlin.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Oder Chiou <oder_chiou@realtek.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 20 Jun 2026 15:50:58 +0200, Diogo Ivo <diogo.ivo@bootlin.com> said:
> Implement the get_direction callback for the GPIO controller to allow
> consumers to query the direction of GPIO pins.
>
> Signed-off-by: Diogo Ivo <diogo.ivo@bootlin.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
