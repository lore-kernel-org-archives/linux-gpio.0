Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D3C338599
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769507725; cv=none; b=CkUfPDfgM3LwL1wATpKskZVpS0+SiMuXBEmBzehOxHv82f4MaO5M6vDxAOjrW0lt+33mzEC+6l/HKneqBkrHHcnTcgYucmF184CkMv4johGKiPdur1IkEYnlX/3MPtVhyyu2SEwYe+F44oL4XVpBufDq7zWtjeON9QBek9tzh/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769507725; c=relaxed/simple;
	bh=ss8QcpVvCObtWUV9GEezJN46u+D0T6WqCQiQjj3l5XU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FzR+lSUMKDXoaq9BMIgWcdzZw/SBpQh3rDrou9ZjMmEX0Xj/xOV16E13fjnelLoMbAaFknGTHlE3rq1eXYAA5En0VuewCIyGNyBDxL2tC07suTfcqHx6RujXHETVo4SoYcRuZZVN205PusTy2UHDwOShNIH9er8XI3VYBztTqrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ITCzR340; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ITCzR340"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8257C19425
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769507724;
	bh=ss8QcpVvCObtWUV9GEezJN46u+D0T6WqCQiQjj3l5XU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ITCzR340xc85/kNrDS4yn6K1x4B512w815sJ6XDH0osJJvDrMyrNqG2tjq9UxwVVI
	 C3gvGwXE5ABpl+8zYDmanKylcO/dtZ+3gBm8CJNXboz0Wm8baxeKaZiykO7Z5ABZdW
	 Z4I/wU3rIxW/+lG+Wd1aXMdoPF6Qrd+M12toGZ8IDSYaGM/7dZfe7qKUAlUAWbLM77
	 p6WkngEvTJc4niKhk5zrY5p3r5ZpYqsMkWIjeGZKDg2+s6jOWE3GZ6wzBKoACkGr7X
	 EhSuf9JfcVeUXJ10X+ZFoGMUt2tWWJXV8FWJpiK08vZyTtofuQLeHNY2TCHY7E8QS+
	 daYmR/9vEgV2g==
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-649389b1cc5so4894068d50.1
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 01:55:24 -0800 (PST)
X-Gm-Message-State: AOJu0YyU0dovOB3ODyeuiq5Zh+upRM9KinVMAbLl8DLqLUDlI6YL5z5z
	Se9VeVt0GdZeAdxxmrbNxQ4u3tlY71wn1qQSznhYDAA39Es1fFaAji4w8qfXxgA6xjTzgtwI49w
	rWAiSGAgwnooa3eHX6MeIJktyiJzQiuk=
X-Received: by 2002:a05:690e:128e:b0:649:6dbe:4c95 with SMTP id
 956f58d0204a3-6498fc21d8dmr624924d50.26.1769507724249; Tue, 27 Jan 2026
 01:55:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aXeCgo5w1YOHUKiK@black.igk.intel.com> <aXh-Ngz97DG4KneT@smile.fi.intel.com>
In-Reply-To: <aXh-Ngz97DG4KneT@smile.fi.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Jan 2026 10:55:13 +0100
X-Gmail-Original-Message-ID: <CAD++jLmdQnKM39JOXPo6iQ8X=T5zDoAHS8wBrfj9e83dinCKhA@mail.gmail.com>
X-Gm-Features: AZwV_QhSU7zoqbDPQeSZNs5p__m1bLnUL9zKeemsv2mYECrhgbC33_5nLNa2qtM
Message-ID: <CAD++jLmdQnKM39JOXPo6iQ8X=T5zDoAHS8wBrfj9e83dinCKhA@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 6.20-1
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux pin control <linux-gpio@vger.kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 9:58=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Mon, Jan 26, 2026 at 04:04:34PM +0100, Andy Shevchenko wrote:
> > Hi Linux pin control  maintainers,
> >
> > A small but important update to Intel pin control drivers. The main thi=
ng is
> > documentation fix by Raag to make users less confused about list of sup=
ported
> > HW. Everything was floating in Linux Next for at least a few days.
>
> This went to a wrong Linus' address. I will send a new PR (within a coupl=
e of days)
> as we got more patches there.

I actually see it because I'm using some clever lei and korgalore hacks to
read lists now.

Send more pull requests if needed! :)

Yours,
Linus Walleij
