Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB0917D6
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 07:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777017184; cv=none; b=Yj+7ryhQX/P5CuOo6tb8NIawn/MMl7OO7MGU7lCnO/VyAS2iW6RKdqDM3G154hR1Js6rFCLhyg5eWYYMUwadMxG7QAGygrlTag8lSwiHuczV9fY9RDY0gNsAGWj2O23IuqQFueYArWH3xpLgd5/YABKj+seYb2fWwrtn42MFtrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777017184; c=relaxed/simple;
	bh=K4lnZ6woT95ybB008fTG6ieOTJpqz2f99IST9cPfWh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ImSg9WrIZrnJ/Xbxo7NBbJZN1OvUtyPYTffZ8jCJ/PENeFOfTJ809sl36GiplTWX4wfE6ExSA8RbhwnnU4seGxF6hkhiVLvpuUOxyLT/ShMKkAQsjpbhfcTNaJ4u/ii2Im3NbRVpNh5nao66vPVAbeiylzh4Ld0SVE5G3vlK1Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bl0nCpOI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bl0nCpOI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00CAEC4AF0C
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 07:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777017184;
	bh=K4lnZ6woT95ybB008fTG6ieOTJpqz2f99IST9cPfWh4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bl0nCpOIV9lOLOz7WCcI8TuSYcTAfbw0abyd2BhP+AST2gL6HF4h+IwEukoHGCcy/
	 fTW/Qyyi2tmCUAn8ErycQ2PqE+eQkHmeAVoh368sWuRw1ZPM2vEIrfcnPMMRHTuOp2
	 Isx8zg0Tke8YeRRA/b1AFL46kiXTm+TKppoSFnC6QHr1xMk77VedW2JVrGSXKILCAV
	 uQ0LJl62z0qz4qKMpMq6mco7xreE61dhOI9QR6C0mB+KhnpWaxGfHJVVEvrX0JAlJ3
	 aNIuLtNsDW//L9BzlY2Ryjqai2GSgZ1RexsO0/tTFEZWKfSSd/hvwiwyqcYOAEzRsN
	 vFCkdiSs4/26A==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a2c500750dso8634468e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 00:53:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+tFuOVFVnk182VmZj2NIpcO82x5/tmcfE7qbQqnPLC4iG19KRAjI6Xzzmz4lal6SGXz646Ywf9TPMy@vger.kernel.org
X-Gm-Message-State: AOJu0YxI9t5rouVmpRxt1y0pvnByj20IMvoMmz7sIHhq1fGQM44fTb4h
	EwJ9KgT3n3bX98NHFcMgbJJLWY+ax625sL/TLHIx/6GKACYW1tuYCzIn4HBboGiTTtsXzFygEaX
	zwZs78Ox+8KaVK2jU+fcK27Scmmp3X/A=
X-Received: by 2002:a05:6512:39cd:b0:5a7:398b:d191 with SMTP id
 2adb3069b0e04-5a7398bd1cfmr577262e87.1.1777017182582; Fri, 24 Apr 2026
 00:53:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260421104358.2496125-1-shubhrajyoti.datta@amd.com>
In-Reply-To: <20260421104358.2496125-1-shubhrajyoti.datta@amd.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Apr 2026 09:52:51 +0200
X-Gmail-Original-Message-ID: <CAD++jLnPA24oV-89hAhu4msQQTeoPAh09Xm_cR1PunGHW8EBtA@mail.gmail.com>
X-Gm-Features: AQROBzDMenmqczGXy6g1jiZ75__AxsDh7gV6rtaDXDspLtZnQ9GdaBkuXdCUDO8
Message-ID: <CAD++jLnPA24oV-89hAhu4msQQTeoPAh09Xm_cR1PunGHW8EBtA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] gpio: Add EIO GPIO support
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-kernel@vger.kernel.org, git@amd.com, shubhrajyoti.datta@gmail.com, 
	Srinivas Neeli <srinivas.neeli@amd.com>, Michal Simek <michal.simek@amd.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 12:44=E2=80=AFPM Shubhrajyoti Datta
<shubhrajyoti.datta@amd.com> wrote:

> Add the EIO GPIO support.
> Add the dt description and the compatible to the driver.

The series:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
