Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3803F26E706
	for <linux-gpio@vger.kernel.org>; Sun, 19 Apr 2026 20:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776629774; cv=none; b=rVNdErX+ELHqZ7nmiBLz/puqKyrDtP0Ax68hciSQZbgF8AnmtSAEmcY8guJBoqvat0AUYjTWq1USaEV4dx9ET10jZUMUFPXTD/3YISaRBmzYL423lC4Nw5C8VPKixCJ/UKyTiFFqL7NHhj3ayV/Ijh9T07PAT/YtwtUqKtIoE24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776629774; c=relaxed/simple;
	bh=GDhTvkiJqhINQX5MFA+xMV3KNOf+hKPswGRtUCHk2Eo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qv74gky6NaiRVFcVbkJQx+JB3HkWYMTdwcrbmpQwZ7NgeTmSUpT00fHbSx+FiQ2BeDGO/SjW2jyR4MjIPKRDAVICsoBKY+97kvjQ3FcpGGIBla8U4Symc5uqqrT4QUqKtc2sROlHnheOiUwWZi8cQWD7h13mH7fvrJ0WiVdsfgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UNanYgSP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UNanYgSP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2A74C4AF0C
	for <linux-gpio@vger.kernel.org>; Sun, 19 Apr 2026 20:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776629774;
	bh=GDhTvkiJqhINQX5MFA+xMV3KNOf+hKPswGRtUCHk2Eo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UNanYgSPKXhtuQvcTiknRwKiDS9Z3TFB91umg6u66Ih3mNWwJy8GNtsKysjS69wpy
	 bB4RyP7aCcX6KD6SQJfMzpwH6l1da88TRB6lnaBpqbqwU/dhlYxUj6jBpY8oJ1VK3t
	 +d269WHIqdURtvLMz12R0wPmf9qMtdCKSOLBjxHzWumRrnZDedhu6ciJpSMBsq2lTI
	 tTizeQwPIHoqUxKWULSBn2geZhhZs36o6weUgFJb45CIdBmgRiWcTmnMuOa+rmMWL2
	 eo3rGJsgEpATg7xGIccjKDcwh44zwd6c6vZcYKeFT9Rdb3B/yVF12H8Ws2/vOFuQXo
	 WZhm4V1v+AdTg==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a1307438ddso2232339e87.1
        for <linux-gpio@vger.kernel.org>; Sun, 19 Apr 2026 13:16:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+DHh0ZSHME+PkhpRuiL+qKzE1qSpssUpddyVHs8aeIiU7052nuzXkR0Lto3rl1GOi5p93je70SH7i9@vger.kernel.org
X-Gm-Message-State: AOJu0YwdHPuhHwNwm4L0YkorVctMgHtgxSrKM9R95u2HL8V9Tjq6b14H
	5ZdK6a8q3Mip+RbVa5n+qPKu4TvWyah6TTe97U26KiKGSf+Pl4vPPcPDpQNMVmFc671KkfaVjwe
	UbyLhEsEZJjMiaUQhnzqvRAlFC2pwEp0=
X-Received: by 2002:a05:6512:61a2:b0:5a3:ffdc:1d22 with SMTP id
 2adb3069b0e04-5a4172e4ffamr3383211e87.36.1776629772615; Sun, 19 Apr 2026
 13:16:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com> <20260411-waveshare-dsi-touch-v2-14-75cdbeac5156@oss.qualcomm.com>
In-Reply-To: <20260411-waveshare-dsi-touch-v2-14-75cdbeac5156@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 19 Apr 2026 22:16:01 +0200
X-Gmail-Original-Message-ID: <CAD++jL=iJmYKB2psb0A=RUAFZhKtc6KQmsB9HED1-LQAAFbYmA@mail.gmail.com>
X-Gm-Features: AQROBzDjOWLTCpwVHd-bfYDfUqw6vHHRtJrX45Wrd5GY8ZZuzBfZra5z61yRT00
Message-ID: <CAD++jL=iJmYKB2psb0A=RUAFZhKtc6KQmsB9HED1-LQAAFbYmA@mail.gmail.com>
Subject: Re: [PATCH v2 14/21] drm/panel: jadard-jd9365da-h3: support Waveshare
 round DSI panels
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Cong Yang <yangcong5@huaqin.corp-partner.google.com>, Ondrej Jirman <megi@xff.cz>, 
	Javier Martinez Canillas <javierm@redhat.com>, Jagan Teki <jagan@edgeble.ai>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Riccardo Mereu <r.mereu@arduino.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 11, 2026 at 2:11=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:

> Add configuration for Waveshare 3.4" and 4.0" round DSI panels using
> JD9365 controller.
>
> Tested-by: Riccardo Mereu <r.mereu@arduino.cc>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
