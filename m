Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E72F2FF67A
	for <linux-gpio@vger.kernel.org>; Sun, 19 Apr 2026 20:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776629924; cv=none; b=KswAG/snH6snLqQSVpYK09u1mh5MK3lajVa+hTYudsf0Re+WnfaT7TdM6BnPvEIpufBXMB84vONYZQbvxkuZGW0Bct/dZMJxQ0aUHJ251tfm2d8A/gXGUzhwHJlbrqWi5D8uXdQscubIPsiMjeSskaQ1VAaFKLQlcwutDQdor8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776629924; c=relaxed/simple;
	bh=OLw+eRHqgrO4zkt7f8sg4S1N4ShOJ80xQG0TYWK7Fzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fdHEqnBlkm7sfMm/Ih01X2EImrN4HAc2OwT2EbyM1/rhHBX78eNOwaoXcPVATpFgj7OTKEd17MtQl3cor2JKWwlj69tS40fcRISS3wM/NCS0xjNbSrcMumPn37sNy6Ry39QgXoaW0CiL6fzSu9CF0al8prb+ws5FbwEEbMv566M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bdqXyam4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bdqXyam4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33E7FC4AF0F
	for <linux-gpio@vger.kernel.org>; Sun, 19 Apr 2026 20:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776629924;
	bh=OLw+eRHqgrO4zkt7f8sg4S1N4ShOJ80xQG0TYWK7Fzk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bdqXyam4T54s0JFglAzKfobk/dK1aCbxutS+oHayTXXfHKcPGoDxQSMfQ2+tnWYos
	 yR7nqQ7s0ulRQyYnm5pURSgZqYKFsE560VmQSLNFXuaeT1M7TfmsgMVgf8/0GYmyZp
	 k5DDFFuiH5lFoR4vtuFe34Dt/vEmLsGyGsibDClZH3AFBmbZaEAkZbn2Hfym2NPHTZ
	 N6FZPe025h7lf8IKuJwgm+DkE1X1JiCaVvGnC4OWPVanXkrBfraJtBbGQ0PamLUhfO
	 SmzgbIcDxVRq86SrH/U9LSiiAboftYMCNUC2B/neKQxfAvX1GiOX35ElYtpxWSVOQ3
	 +ayrGo2jnsu1A==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59dcdf60427so2049855e87.3
        for <linux-gpio@vger.kernel.org>; Sun, 19 Apr 2026 13:18:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9MrWJ86FY2Zqs85JcXYULInApNvVCn/Qct/f5RibP7zMxVZ/Kur/eywHyFYRMRhX5KIfP7ycs78iAN@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4Pn4L+/5QfeKeTyHT91QlIDmf+nwowI32P45kovuQN5zGiYOu
	2UEjJ7cvEnLFf7Q8L9HW/Z8TV+iWF49rG+Bbft3TaXVyaRMVtD0CA5z8i4LcmvdaU2SdmpRVNzn
	dyttHzvMW96iGMbdSrfcT5GgXSaVaLC4=
X-Received: by 2002:a05:6512:6d0:b0:5a4:1b8:1a92 with SMTP id
 2adb3069b0e04-5a4172e7c28mr3289204e87.21.1776629922903; Sun, 19 Apr 2026
 13:18:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com> <20260411-waveshare-dsi-touch-v2-7-75cdbeac5156@oss.qualcomm.com>
In-Reply-To: <20260411-waveshare-dsi-touch-v2-7-75cdbeac5156@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 19 Apr 2026 22:18:31 +0200
X-Gmail-Original-Message-ID: <CAD++jLkfBhdhhYoPwGEt4XghNGuLFaMEHsKPbjEoFGZv_JJiKg@mail.gmail.com>
X-Gm-Features: AQROBzB3V9CUelEnoDXtHgFP9-TRM15zDUUV4XVkXbwM8iX4PWyJW-UeLgVME0U
Message-ID: <CAD++jLkfBhdhhYoPwGEt4XghNGuLFaMEHsKPbjEoFGZv_JJiKg@mail.gmail.com>
Subject: Re: [PATCH v2 07/21] drm/panel: himax-hx83102: support Waveshare
 12.3" DSI panel
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
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 11, 2026 at 2:11=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:

> Add support for the Waveshare 12.3" DSI TOUCH-A panel. According to the
> vendor driver, it uses different mode_flags, so let the panel
> descriptions override driver-wide defaults.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
