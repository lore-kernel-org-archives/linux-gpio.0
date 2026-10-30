Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793374496;
	b=BuJ88oQGv70N0U6LO2vcGQE6zxoE2FdwyPZiIGeRSLtO+mKWfCqWzmyHlYcNQZyPKOSp
	 hXYla366Gr61uNIL255AkJUWqugCICUiKIXUvAVbHrvtxb8zzDybtvt32XqPysZCZY7gr
	 hulGcMIa8uzKejzktr/MiKaMoQ5P1NxKb8iaMaZcY6DbIXWuc+3IKDaLfWtpH0Px6DHHj
	 CIMBTt3meG38VaIRbvoC6ORYval2jhk680j1SwNVSOIE7/9APXNSU2IQ6syluAfJVRKvn
	 C4SKGxr7xfEp5j0huCgaV9p3Hjt7adFzI8/Wp8gj3P7hhvRXEIknE6v1IaC33rEdVjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793374496;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=2nynLpP1b4JGFTXRlfOs8CIcAYSC6oalW0fdM49o5KU=;
	b=P2e4AI1S2wLBQpLotb1SJoUoLP1dSYhBjTiMkNgkb25JrWzhDa7GLtax+cSYTt3JA3lw
	 u62/au6uSvmARy6j5hs5m9eChjh4f/WoZTtgCthqjiUbnGEfzf9t+txvyYwULwfKkokAD
	 JRWPfOq+b4AdnsHqCIyPa0c8o/86oR80ubnhQYvc42Hp4ME5vlCxFnXlM9PwrNtICH9wr
	 uKr22m0IVjOm/HegtkaaxKoevSrQ67KvI/Y5e3lGvastOkWnY/tsgc/GqJp6Q6Z/z+bcF
	 Mn7Audy+RtDled6uTNFnG43fEMC0xWGUKVTEjJG8AdMg5CQHA61IoIPM9bPS+Ht6B5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JCwpR+g6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DF9606A31A;
	Fri, 30 Oct 2026 15:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JCwpR+g6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E6FB1F000C1;
	Fri, 30 Oct 2026 15:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793374495;
	bh=2nynLpP1b4JGFTXRlfOs8CIcAYSC6oalW0fdM49o5KU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JCwpR+g6g4sH90VywS5fE/AGCZL39OAA4sRLLJMVMhmk1aoOF40ErNTY7fecVfwrn
	 cwAiMg5at1jyNa/ZO5pok+xwQs6U20NdxGjrKt13xG2t8o97OWywP6cvjkHEMkCaWM
	 8iB4Nq8KCfWPoDL6Jbw+Ycarpc1pD8CQomtymaQS9J3G3K4Npy7YkyU2LMqVhOw3xx
	 igSBedXIqSZKV0Ig3ww0Yv5bmxHS1cFtIOxkRLzcpPVmpHIcSDCrThPax3V0O7CxG2
	 JklXAA/glYXQgTinofAFDPucg4ECTFuPIxzlW6clBPBrquHhVi4/NJN+C7zKq484vO
	 GoFf8ajNQJzCQ==
Date: Fri, 30 Oct 2026 10:34:51 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v1 7/8] dt-bindings: pinctrl: Add
 starfive,jhb100-vga-pinctrl
Message-ID: <179337449076.68745.13072143632086612372.robh@kernel.org>
References: <20261017052534.115203-1-changhuang.liang@starfivetech.com>
 <20261017052534.115203-8-changhuang.liang@starfivetech.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261017052534.115203-8-changhuang.liang@starfivetech.com>


On Fri, 16 Oct 2026 22:25:33 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC VGA(vga) pinctrl
> controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../pinctrl/starfive,jhb100-vga-pinctrl.yaml  | 163 ++++++++++++++++++
>  1 file changed, 163 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-vga-pinctrl.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

