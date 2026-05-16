Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCB31DDC1B
	for <linux-gpio@vger.kernel.org>; Sat, 16 May 2026 14:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778943526; cv=none; b=LBOj6N7pCCMN7WmMG5JZlfHzx+S8nPE5J6OwJbaQLzj9HNQtec26mIXvkbro9StMZndRKlHKL3T4ZUdFOsVVjJMp8xAWIB7vX6MqnBpZgTVJxP11Vu7aaYCLGYocGP57hs9pcElIOfSsz5noufSgYUZopzUg4CyCYre03FO9tb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778943526; c=relaxed/simple;
	bh=cj6DCkgT4nLvdRIrKGN5toggTRHiMavADIBTkg63RsE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bmJroF1Rov/DODZjbnblWp+oTT62ndsq+PdAKCo1rEn0j8oOSu9UrCmUfMjRbh0RcN12SHf1ACcnBW1YVH1PFNNyIK1U0PCUANK0Vja1lbY0juX1a2ETZC4ZuQxb4dayunv9Q50P6ZQ6G5F4Og1fTJmunG+WLsn+QjXbfkCyQQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eGQV6Yjo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eGQV6Yjo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06229C2BCF6
	for <linux-gpio@vger.kernel.org>; Sat, 16 May 2026 14:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778943526;
	bh=cj6DCkgT4nLvdRIrKGN5toggTRHiMavADIBTkg63RsE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eGQV6Yjolm3KPajKQCTPhOXBTnJiQHGujbPXrxoHisgiQihaxNxPQeylYzml+oQ0E
	 UsyNGC9BcX8CBGookrLqzTHUAb9Bklp6f3IHDeVWWln30UowpCWtYY4HKNrtfVQFF7
	 jKejTCzA9XyqPW2a8ckzbaQd8c6PBM6XZoor35sOcVe5aXU6W+8msj4hfFjcKRVy6H
	 L5fRMDpRihEGBv79UE7RtDqa6YsckOvEX4OCkVPA+t86ds+8tWYcu5ajiBD0or3ebM
	 gCK/vIeMUUQM2i3Oyayo735pd3mSjJ4iMqGJv3PmNe9Y4trxtK4+13REJKAUOGJJwT
	 rZDwl8UMC+GnA==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a995ab70d1so1309857e87.3
        for <linux-gpio@vger.kernel.org>; Sat, 16 May 2026 07:58:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/rimbeZZdNxrEma9+f/b7Rm4HgvK1m1ZCw3UvCIEOYImHPBquMaxanmj05rDVb1MEcTQyjVQmISktS@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9MWr0kMQ7EvMsX3aj2hI5DdSzbtJhDw+FF31WZLDE+gu9E6c7
	AIQSIWRowwYnZWlvbapcpuHqVFpFXfXfmtgHHwskEDOudItc+qzKRy6TZqQ7FWAl3g7eeV3NgX5
	B1l0zymi0TAMu5GHiRK/F1FUEcaG4VxU=
X-Received: by 2002:a05:6512:3409:b0:5a8:73c3:f27b with SMTP id
 2adb3069b0e04-5aa0e623b51mr2521095e87.15.1778943524744; Sat, 16 May 2026
 07:58:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506-energize-dramatize-051909e54256@spud>
 <CAD++jLkEfqDrqaxTjxf4AwHPcdCppPfO5F7H5YnR2gebzhZFig@mail.gmail.com>
 <20260514-used-revival-306ddced4ab8@spud> <20260514-afterglow-overlabor-bc483b2a8b35@spud>
In-Reply-To: <20260514-afterglow-overlabor-bc483b2a8b35@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 16 May 2026 16:58:32 +0200
X-Gmail-Original-Message-ID: <CAD++jLnsL7w+2mR6JmAEwEXcfbipoL6eLWwz6g9ZCbr4T22Wmw@mail.gmail.com>
X-Gm-Features: AVHnY4JdmrVpvtaNxwOlXXn3NxCkXK8mtEn98EOr0BMFQmQRWm8DuStr0owd8fc
Message-ID: <CAD++jLnsL7w+2mR6JmAEwEXcfbipoL6eLWwz6g9ZCbr4T22Wmw@mail.gmail.com>
Subject: Re: [RFC v1 0/4] generic pinmux dt_node_to_map implementation
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 9:40=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:

> > Right, well I'll go clean it up I suppose. I might send a rfc v2 with a=
n
> > extra patch that tries to get rid of some of the code duplication and
> > you can tell me which version you prefer?
>
> Actually, no need for rfc v2, can just paste here:

Looks good with some renaming.

Send a non-RFC version when you feel ready!

Yours,
Linus Walleij
