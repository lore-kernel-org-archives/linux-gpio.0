Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B0A38644B
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 09:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774256664; cv=none; b=Tj1Om0mZ0ZhEeh+FNTAci8M2gvwc7FFV+nAh/sDYpaBPuaqWua3Pj+S4wwESiHuiaUPuhS8ArtTu4vALQ7dCl2w7Ob/G5GhrVQsogbRwG3IWU+ukNLSDbi/7Fx1+yD4qEPEJQYTkgulmsKKoqCFwQioOBs7TxkIAbGDmEGEeqnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774256664; c=relaxed/simple;
	bh=CHxEWkwgCvKhtru7JHa2zSMKFKwZ0cGz1RP4X38VhkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uNUWnFtEhrZUsWJib+d7WQHxqZ5JhJZOmDWKJq3B1V2f8bjzWtj6xXskd2W4ffLZI0rVZO7CFCCKdESdn7eyFmCPTZeAqThQ2y9TBhQlDcAlCKe4mvklVz7EZsDDpskKbMLr28rIC/0smN4d9nf0TxBLfT3b1SSgvlVq+qdmJl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lOgGEWMc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lOgGEWMc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49708C2BCB8
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 09:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774256664;
	bh=CHxEWkwgCvKhtru7JHa2zSMKFKwZ0cGz1RP4X38VhkM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lOgGEWMcgXue43r4VYarYu1alRlyVb1yCOGINwilJZEfhMfjd3NkVJhAhNiNouKU5
	 /abvT5VauAmmComqNrM7CASX8lzgf2A/ncd4R3IDoiOft6Q88geRkoJbRUC6RWUsFt
	 RsbT4tZPtSh+ZdMSR4O86MssGOPhlA5jEGoblu7FcVJoZp0c5APBb6yRZcqYO734ah
	 Vaflkx6FMOnH12UI2dpPodqsd9q4yuHiMp0HK81CcmPpHalw93gqr43n5GD9xGtDT6
	 NAAeYOQ6jYgU/MbNyDSdh76ajSKgYPjWITsfJ191EqU6TishfsAyQbkBXuB2fsPYxh
	 553jBM1YyxXZA==
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-64e9d72d5f4so3087733d50.3
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 02:04:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVrXN9Ned6cO8CZnQxJFmkD2kKYuOEYg53dil4rn2cW/WWrkApgAaR2KyPpbGgxYdSDoM0kSmRTvSPL@vger.kernel.org
X-Gm-Message-State: AOJu0YylU/f369zVpwa1hNacFBThoEumTVy9X69uPSe0uVJq45AFjnJv
	9KOZbG9XVGtmXDUAD07BB9qOqZM4eN9tGbB3wh1wywGZOFBz9VqAOdCjdGzpj6mBL8Ykc1c/Huo
	RH8KepuEifCEcMrbWzBZbPQWPntjz1hc=
X-Received: by 2002:a05:690e:edc:b0:64c:e97a:4dc1 with SMTP id
 956f58d0204a3-64eaa7eb74amr9335133d50.63.1774256663654; Mon, 23 Mar 2026
 02:04:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316-eyeq6lplus-v4-0-bf44dfc7a261@bootlin.com> <20260316-eyeq6lplus-v4-5-bf44dfc7a261@bootlin.com>
In-Reply-To: <20260316-eyeq6lplus-v4-5-bf44dfc7a261@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Mar 2026 10:04:12 +0100
X-Gmail-Original-Message-ID: <CAD++jLn7PBJ7_5=qxgkvW0Ne5FYugVcXRAadNxUDsQaPP7noog@mail.gmail.com>
X-Gm-Features: AaiRm53UTjsbahjmuSRSfD7rVi5GU2Ick6V0yQm5ZuBdfQqJbkn30zWageiPKtc
Message-ID: <CAD++jLn7PBJ7_5=qxgkvW0Ne5FYugVcXRAadNxUDsQaPP7noog@mail.gmail.com>
Subject: Re: [PATCH v4 05/13] pinctrl: eyeq5: Use match data
To: =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 4:26=E2=80=AFPM Beno=C3=AEt Monin <benoit.monin@boo=
tlin.com> wrote:

> Instead of using the pin descriptions, pin functions and register offsets
> of the EyeQ5 directly, access those via a pointer to a newly introduced
> struct eq5p_match_data.
>
> This structure contains, in addition to the pin descriptions and pin
> functions, an array of pin banks. Each bank holds the number of pins
> and the register offsets.
>
> All functions accessing a pin now use a pointer to a bank structure and
> an offset inside that bank. The conversion from a pin number to a bank
> and an offset is done in the new function eq5p_pin_to_bank_offset(),
> which replace eq5p_pin_to_bank() and eq5p_pin_to_offset().
>
> All the data related to the EyeQ5 is declared with the eq5p_eyeq5_
> prefix to distinguish it from the common code.
>
> During the probe, we use the parent OF node to get the match data.
> We cannot directly use an OF node since pinctrl-eyeq5 is an auxiliary
> device of clk-eyeq.
>
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
