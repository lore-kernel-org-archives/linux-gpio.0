Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF993CA4AF
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 12:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779883806; cv=none; b=sbN6cc4g6qwpGyNDFVh4fYLaxEeR9ryLNtVcOMeIOT7JPO25j5RvBd5C9J0hzhxLV4ILIiCnHr2yUndjlQ+xobDvxh/6/odHC1Kx4f/LO6Yuy17ze0KGwFuN0lRK9l36rhvcWBvd80y+wmhbTTDL3LNbM6+hiRhluD4b4ElSYiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779883806; c=relaxed/simple;
	bh=5BK8aIvh31QvoRbR2TZwELM2z/fGdZClTOQ8PoC1cJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JAa4SDtAYWBZt7fjg4wZGzTvBLJ+Y1MjdD2ar2Hhqs7GBvRM2r2aJCGRRd0RRIQtwjNkBriPtOvxzdKRShK/T1aizKbFVJOPvurOXu6N+/5sZNMQkw/JHfophFIPWL5cj5gOa3ZIriydaXZP0LNzl99eYzyCzdIHpQ9K4NrY/fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ATtJta9E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ATtJta9E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4133A1F00ADF
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 12:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779883805;
	bh=5BK8aIvh31QvoRbR2TZwELM2z/fGdZClTOQ8PoC1cJ0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ATtJta9Els5BLcHxzM77kQG2Qhv+ZEQV9hT8UzYy80MmlMXL8eplRbygn7XbkH68j
	 VX+AMnjyoLHP/doWeHBfDvSCW8iTjvbI9krwfPoP78FEGiXngMTP3Lkri7g0nS8my7
	 T8B1MxZukn0ovx/kDiDLisYrRhQF0ciJTB77HQwbowFFFC6bbPVZQ5nwfWOHqAVjvs
	 1ZNQkD+D6+mi2dFqVTAHmWYdvnOrL+X7s+m0Xyc14jKR0riyY9DuS1w5fW4P41J7AF
	 u9eObtSi4ct7wNA2eskG6aQZSn2V8884NXX0I/6Vv4nmuCYhcQBwb6ZOZPX7o5OirN
	 8KOPZUiCFlN8w==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a746f9c092so15928408e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 05:10:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+ChqK8l/o2hemiLebADVyL7e7CydWSjNA3aDxSf5lZI5BvwVFeducd21tw2KmLg/DXgO+6o+H2wHXh@vger.kernel.org
X-Gm-Message-State: AOJu0YynlInnhMfvSE1HHFVdqxCyuGTinMtKToxNTQbRruR7etCUjaXp
	Wm1agGk1mwkITppI0zJ35erQL3fwIQYNSlSrUatD3QqKfYhby+qGRBiews/Mer0+qk/bPjmN/AP
	VQ+DSNmXR5rJeEzAcvw8rALKc8YS3vlg=
X-Received: by 2002:a05:6512:3b28:b0:5a3:ff48:f7d6 with SMTP id
 2adb3069b0e04-5aa322fb0e3mr5806451e87.13.1779883803943; Wed, 27 May 2026
 05:10:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427134231.531222-1-pshete@nvidia.com> <e134911f-e4cc-41ab-be41-0c559790acde@nvidia.com>
 <53e92651-44b0-44fc-8340-28a3b311d06b@nvidia.com>
In-Reply-To: <53e92651-44b0-44fc-8340-28a3b311d06b@nvidia.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 27 May 2026 14:09:51 +0200
X-Gmail-Original-Message-ID: <CAD++jLn4CwgDOTsMN6XcaO+qm8g-vBM+ZoZkxXZkKQ__ycDKhQ@mail.gmail.com>
X-Gm-Features: AVHnY4Kot8xJGng5frQ2F5u7E8f_oQRgYTnf7txntFMoPUGeTKYwdYqhY9PeVxw
Message-ID: <CAD++jLn4CwgDOTsMN6XcaO+qm8g-vBM+ZoZkxXZkKQ__ycDKhQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] Add Tegra238 and Tegra264 pinctrl support
To: Jon Hunter <jonathanh@nvidia.com>
Cc: pshete@nvidia.com, thierry.reding@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, webgeek1234@gmail.com, 
	rosenp@gmail.com, linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 10:18=E2=80=AFAM Jon Hunter <jonathanh@nvidia.com> =
wrote:

> Please can you let us know if you are OK to pick these up? Would be good
> to get them into -next if there are no objections.

Applied now, sorry for the long delay from my side :(

Yours,
Linus Walleij
