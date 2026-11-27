Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795747293;
	b=Olzr+KTLqO2AgjFDoVMnwL8M4IPcVZ3Gh7QqbG5XQ2NzWodEH6bs9o7xw2Bqb9fSXrnG
	 3x9iA3HgcUerR/A00dTizrnud+hVuOrV1BmcbqEqTKUNu+DL1Nnp+AenQsjE2Lk+iwlwi
	 GiRgAVdjr0rHTbYI3meg8arWlugZzWrLh5GhhMDis5uYYFyJvK7LvyF9jNgPX9eVyM3v4
	 ik6rSOy2q/YUlnx51vVM9k0DaK+d4urlJJTz6WcLD2ttrnp2Vz9VSy7TW8Vud66EG6vnn
	 5VgJJd+1wVXCQqjvHIiLw3b7zf8SAyAqPefFRZxXyRMBXHJXxF4GTcIHeTrK/zSC5jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795747293;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8upx0SspT6TuTqWf876yYYsf8t2JCgqFs13e+Bckdow=;
	b=yP1GBTIQ5i1/cfsy5eWVQs2eB44KdkTLngCzLQMp+gu7S5EjiL5fVu1zVLUhtwV8hIHI
	 neO7UDhdA9Pw8mpBp+saVtxdi3QmWkTPKLtEzO/TQnf7mJx8ZK7ULvoNFhh/1am3kPh/u
	 sHA6sjz0+9HrJz5soqgw3R4R5z2JdUdBrbJzec2Jsou+DOXzmpWdSXxgh4RDd6ZrEIBh1
	 wj8HUCAbsHOC24XqsN23wMcrUML5h5spx00kYuTkCozWRpvKn6nGqu6aFIJd+uyL+7A8A
	 FTCAAqzFT5H95x56coi3ffQssEquk6me3Y9D141Kfd+NeEjvSBh9Zrs3wZybeDPoIlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MmTT6pZj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61C6606A31C
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 02:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MmTT6pZj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D5BB1F000C1;
	Fri, 27 Nov 2026 02:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795747293;
	bh=8upx0SspT6TuTqWf876yYYsf8t2JCgqFs13e+Bckdow=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MmTT6pZj0mFGtq27ROA593ThRDu/kU1m5Wtz45lsm18ItEDtT3hjYZ6oIT69o2J5B
	 nOdreWNM2QP+UerOBhOghLS98fIC77wCTNkTAxXNP45yT2s416j4nFIyF0A4nbpRMJ
	 QLeW+W96eqrj3zp1Gr8U/QR+jlCw5vHOO5vRtdwlC3Go4Vl8+k2fQeOKtu5zoM3UN3
	 RtTXOdAhEThVXVtxfiBgE5q4eRqEkS9rHS1DbzOBqgwJd+xhuPIXEcuEEKNHS5jw6t
	 66GeGcGQ//rCygqoXUHYAVRpa4Y/4EChbh6oM8vUldFFdA5boRqhit1sEh6UVsq6P3
	 Uzdeqs2Kf+sOQ==
Message-ID: <sashiko-outbox-236458@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] gpiolib: Use srcu_barrier() instead of
 synchronize_srcu() in gpiodev_release()
Reply-To: sashiko-reviews@lists.linux.dev
To: Zqiang <qiang.zhang@linux.dev>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261127023101.27568-1-qiang.zhang@linux.dev>
References: <20261127023101.27568-1-qiang.zhang@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 02:41:32 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] gpiolib: missing Fixes trailer for srcu_barrier() fix in
  gpiodev_release()
--

commit 7bde1b2938982ae74ae917349eb9ea19f1b65da8
Author: Zqiang <qiang.zhang@linux.dev>

> gpiolib: Use srcu_barrier() instead of synchronize_srcu() in gpiodev_rele=
ase()
>
> The gpio_desc_label object are freed asynchronously via call_srcu() on
> gdev->desc_srcu (see desc_set_label()). to drain these pending SRCU
> callbacks before cleanup the SRCU structure, gpiodev_release() currently
> calls synchronize_srcu(&gdev->desc_srcu).
>
> However, synchronize_srcu() only waits for a grace period to elapse and
> for its own wakeme_after_rcu callback to be invoked. it does not guarantee
> that callbacks queued on other CPUs have actually been invoked by the time
> it returns. The following race may happen:
>
>               CPUA                                        CPUB
> call_srcu(desc_srcu, desc_free_label)
>
>                                                gpiodev_release()
>                                                ->synchronize_srcu()
>                                                  ->call_srcu() queue wake=
me_after_rcu()
>
> SRCU GP end
> timer_reduce(delay_work)
>
>                                                SRCU GP end
>                                                 synchronize_srcu() return
>                                                ->cleanup_srcu_struct()
> /* timer still pending! */                        ->for CPUA timer_delete=
_sync() return true
>                                                     and cblist not empty.=
 tigger WARN_ON()
>
> This commit therefore use srcu_barrier() instead of synchronize_srcu() on
> gdev->desc_srcu,  it entrains a barrier callback on every CPU that has ca=
llbacks
> queued and waits until all of them have been invoked.
>
> Signed-off-by: Zqiang <qiang.zhang@linux.dev>

[Severity: Low]
Should this include a Fixes tag for commit 7765ffed533d ("gpiolib: use a
single SRCU struct for all GPIO descriptors") (or commit a86d27693066
("gpiolib: fix the speed of descriptor label setting with SRCU"), which
originally paired call_srcu() with synchronize_srcu() before
cleanup_srcu_struct())?

  Fixes: 7765ffed533d ("gpiolib: use a single SRCU struct for all GPIO desc=
riptors")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127023101.2756=
8-1-qiang.zhang@linux.dev?part=3D1
