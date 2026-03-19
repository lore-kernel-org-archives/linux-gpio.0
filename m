Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A863D3312
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 13:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773927576; cv=none; b=dpdWFZsPAY0rTSP4xcT5uTmne/uobcpUqeKf2fubegSd04RXE1+r5gyfk3tP7TfEeYhn0xc+5t92ZU2nmTeWMoOJevf2cCKDP14eKhUD166uF+qve9FMck72HGc5RgCtWyeobpnIApY1vcnkaZpbLUs+J1GSlQ0UZkNCAxZm7kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773927576; c=relaxed/simple;
	bh=vAL9q9IULS6gVR8sO6H14s+njbeepcHrF0xeAsKVvqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=feIXa+aKAC7owmRsRAJkOe4E8UrUV0SMVQGwfenSNv3EGviC8VgPofbZIJVII2kC4/o5U+T+IMYw/oWf3XNY4DwEMfAMMZj17VMDlq+RNqctiMKQ6jeEFvPGa+Hm3tsnfbGGWnCozI6nQXohittPkcwlNrZo4gXicKu5DzxGZW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cZXUIudU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cZXUIudU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F01E2C2BC9E
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 13:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773927576;
	bh=vAL9q9IULS6gVR8sO6H14s+njbeepcHrF0xeAsKVvqM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cZXUIudUXWS24iMBK4QtdPgQGTrUgY0f4a7UJGLutEElSHv3TJbOVp/0kKI7Xqbt9
	 tCh3x/m9isKEkzSPR6bWRZ6JGoRd827wEwZk2G9vmSCRMoX2i0fdJ2YRA6ekk0cIfp
	 2+L2Aq1QJPFNmO0lPgDRwpEvt273JmDKvDA8IGEGam97X30whpZZCehDyVOUszrFCh
	 ohu4oKJtbxV+5dgX2xKIqtAJptnnYenMpOVx+8SgTYwWZ244xUTnWkUwz+QlalaN9D
	 dGHWor9qRxntw2brJq8NsqnryytG8pWp607dmDLvnm2gVT3TYkAf1La/Zj0NdTAjVV
	 HxpcqgwrPRfaQ==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-79827d28fc4so9097687b3.1
        for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 06:39:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXP4RMzf9eJQ2HiYCIqL7hPq2NNALxNLCEM8rE5R9wyl3eaJhsBWZ4vinoEsu2sGDPZUBqAlS0lcuGn@vger.kernel.org
X-Gm-Message-State: AOJu0YxbwEJh4rf/logsw+zPbnplKHodW+YZXmHKM1S0jOQgot057lUi
	+V2h2NcE3j6sVLY+evMErhpHckW2/7EUoL1uzeePQ49890orlDiFGer3t/+HAZwlgt3+lxHZR9a
	Yn+A+toVL7mY66ujqYqRyr9h0InwGYsA=
X-Received: by 2002:a05:690c:ec2:b0:79a:69d4:ac5d with SMTP id
 00721157ae682-79a718e03a2mr79407917b3.27.1773927575302; Thu, 19 Mar 2026
 06:39:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316-gpio-timberdale-swnode-v2-0-ea0078066871@oss.qualcomm.com>
In-Reply-To: <20260316-gpio-timberdale-swnode-v2-0-ea0078066871@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Mar 2026 14:39:24 +0100
X-Gmail-Original-Message-ID: <CAD++jLnOvGwfmw_ChLpv3H=xiYd2xHps4i-DBqn0SXPT7HW9uw@mail.gmail.com>
X-Gm-Features: AaiRm53xxYCWmJbYZSGcZ1tGVnWlIDQkF46vEa9NxNztLklePK-H27almoBPelQ
Message-ID: <CAD++jLnOvGwfmw_ChLpv3H=xiYd2xHps4i-DBqn0SXPT7HW9uw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] gpio: timberdale: remove platform data header
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 10:31=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> There are several GPIO driver header scattered directly under
> include/linux/. I'd like to either remove them or move then under
> include/linux/gpio/. In case of gpio-timberdale, the platform data
> struct can be replaced with generic device properties. This series does
> that. It can go either though the MFD tree or GPIO with an Ack from Lee.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

The series:

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
