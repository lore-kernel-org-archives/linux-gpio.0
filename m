Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794901597;
	b=bLlzc1y1wwv3HllYAclsWSaebC02RqhRZW0UevNiF4CMAL4dEiJb0x9mfH4HcNfJc4cr
	 Jtxu7hNL7q2a0VzmGI0Hgag+eUvbjOJDaLQN1gTRMyqSRVQkNYY9yZTNAqf33nq8nTLPC
	 kC7HP8fNu4j978/aiotB/VqtOQjaHvjy7b4Qqxwz70DEkhPm3Zr5XJ5FzqdaHy/SWsYqk
	 FIa08g0xFksMJb2pXEi4jJgdZydIQLimw+aWtx1xzNhELyynL9Fji6jaNams6SgNXi03n
	 AEfUwYtTT427vVNC/nKyRgdhVbn5ZxBr3J/J3X7Doj8ZHez3+xfueNIO8KYzBbzqzDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794901597;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+qYnTFW6EFD8XPGcKvRc0R160+eEk1A3eRphSK3PEL8=;
	b=dgKOjbeDvkbCYwgBqtM1011nVELS0DfaYsCRmkG8EdjXdtDF++uNuth9poU2BDGufEMa
	 sd3ybeOirdxgZTsqZKuRD3/q21V3nyQQDuey5FLqIfx0Qixk85dCN8lSJEnbAnj+5nsvE
	 Hnq5DEzUCUeEoq/GlT/xb8TwHeiGUVl7PCvFY9id7OvOiGRGBxJvGu40OpECWNfL9qfr1
	 Mdux4X7b/0gF7pbTaTUl01GIrU6YD16Be/BcSSj6KY/eG0ig2WKbOlc3ANMJudcdwPoro
	 uUw3qCIswJrB8xYWTcqt5l07KDjneRZ03TxyUd8ltSu6NqDuQtEMnoEt6dMnBtI8Dhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Op+ii/CW";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D19606A889
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 07:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Op+ii/CW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDBBD1F000C8;
	Tue, 17 Nov 2026 07:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794901596;
	bh=+qYnTFW6EFD8XPGcKvRc0R160+eEk1A3eRphSK3PEL8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Op+ii/CWTxAhtJhd6zEZ1Zt6ySZGUBRGvJFIVayaKVVesqIbbo1ynOv3p9D+6FD8s
	 YYahjqOk5K/v7/kgJ1bNOM6oSt3ptnae3T4lkKD7HjObkoghVN3qGl8gJBhFd0vjDv
	 QdP4up81mq4BnjYsLjxU4wTm8vtquubEbgOZ+ZC1xTj/xX0TZfollkMvutktjOnfiy
	 6C4Yz5WBdkKaFcaK5zqxtAkg7NxUoj9wlFASTST7PvUsgYjZSq/1svnJPq0h1HIRKh
	 fWvI9h88q5SCNmESG/IJfZtVgkZNYOZ/9vRvUNNSBuYugLTy06odqmg//hVvaQSxyB
	 B/w8qlWt4LbnQ==
Message-ID: <sashiko-outbox-218377@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] pinctrl: zynqmp: Ensure function names are NUL
 terminated
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Krishna Potthuri" <sai.krishna.potthuri@amd.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261117073947.1100444-1-sai.krishna.potthuri@amd.com>
References: <20261117073947.1100444-1-sai.krishna.potthuri@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 07:46:36 +0000
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
- [Low] pinctrl: zynqmp: missing Fixes trailer for NUL termination fix
--

commit 6d64e921f0e4b7c5ff34668587fdab85ea6a7491
Author: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>

> pinctrl: zynqmp: Ensure function names are NUL terminated
>
> PM_QID_PINCTRL_GET_FUNCTION_NAME returns the function name in a fixed
> 16-byte field and does not guarantee NUL termination. A 16-character
> name fills the entire field.
> The driver copies this field into a 16-byte buffer and subsequently
> uses it as a C string. For a non-NUL-terminated name, string operations
> can read past the end of the buffer into the adjacent groups pointer.
>
> Reserve an extra byte for the NUL terminator and explicitly terminate
> the copied function name.
>
> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>

[Severity: Low]
Since this fixes an out-of-bounds string read in
zynqmp_pinctrl_get_function_name(), should it include a Fixes tag?

  Fixes: 8b242ca700f8 ("pinctrl: Add Xilinx ZynqMP pinctrl driver support")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117073947.1100=
444-1-sai.krishna.potthuri@amd.com?part=3D1
