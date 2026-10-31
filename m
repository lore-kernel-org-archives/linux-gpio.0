Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793473826;
	b=ecyhISfwQChbkvXy7R2GoDCiwFYX125XR1Y52CpqNFy0afwM0XDAvfWU8pFhT0kWgh9g
	 fKVXn5fOcfcarNZaFcjfU+4rLWHWRtOCm/NHIE2eLbywmD4I5wpTq5MERmimbOaaU1cg9
	 VinNSWEXALsJBHAgIdzlpf1QctPjN77IUnK77aL4jUpnTQ6TDf2DYKWwtxEqsgKI0LStY
	 igXTH7qmbIbw48fw/xfrCljGf1FIo7yWpxa5s2dlHwTP/MWmaAkTQLatzMTh7LZgysque
	 dM23a2TmIWnk4ln/zw9qpp/W8dUymjv+eccf6kBYdPwelV59SzEiQb4zspUdtsrs3dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793473826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=P15p9Hb5w1tBvsdlJFg638wJNRLHIyW6DyqlyUCSHFc=;
	b=DVYAk+jbbuACFVhl7oe9C+nce/rAoZ23S4YLBEHw/OySrNavvnSvWbihN2A70mxS8YVu
	 XgfnZlfShP+1eh6wr5cyU2qAXke7GkR7s9Fz94Olsy1kplH+E+KL+i+qbgZuFBTpo+MEd
	 mTl1bZQmY+9ptSfN2UYdWBadvq3pEU8vey5ZnhCikSvFSiIhDVXFRPHlCNDEPlQ/NsFZJ
	 Zvumkr4L77DDzBgvp6tvnASpuBCSQqL9hrzh5UDtF0xy47axSgrvtGBmWsdgqg/V2OiFB
	 zHEJymzzB+sn//zDnxkQlpXw3LjYKgsfmk3638dQYoRmmADX7O3DuORDdpnsvI9481A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F06606A31C
	for <linux-gpio@vger.kernel.org>; Sat, 31 Oct 2026 19:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2F06606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-353804b591eso2919076eec.0
        for <linux-gpio@vger.kernel.org>; Sat, 31 Oct 2026 12:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1793473825; x=1794078625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P15p9Hb5w1tBvsdlJFg638wJNRLHIyW6DyqlyUCSHFc=;
        b=M0iRGKX4ZakyHPXgwlWKQuWrbvUmrEt1k4+8j+Da6Dso/Dh7GSCRhGjVKtDYwfzJrj
         2HEAllh00C24MUCD82TGUaZz4bWnjiMTRhAzuWXvWqNUwh9NIMyFAIxSoJmQ4tgmhnAF
         F245HULIR/4UBpfnm4XNgJVWo0HiMpt1bXAuHbkJDG9vLis8pelTxr1WpUiwasUmrW+0
         9tOkzQntOI0UA8bT96YYn1nh7WxQBJCWb1rCljfbu4Ofk4oPQ7yUkax5ncCroyqti4PR
         O+aX72UPS59IWB8w+y+J4RXBJLyCiSRq72tVighCAw7INgBmnyi41FWHKGgDOpB397rH
         f/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793473825; x=1794078625;
        h=content-transfer-encoding:mime-version:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P15p9Hb5w1tBvsdlJFg638wJNRLHIyW6DyqlyUCSHFc=;
        b=iMbkOEyNaQ47ZfkpCmBBTzWt4o670nxPc0TILpDrwj56eajAwMUBYyc+kLwyi2DdQy
         a8pYQEulHB78QZDVnzW6UeGfm+hcVnQ3yrr+OnLrHw/pf/EXgZehDFX1fc0B57gZ8Hob
         xBk+WuCa0ZU5eOZFJPVMaDqMt4h6kP1YcgtrtDhtRY0y90XZ/h8ZA/F/+RG4OnHQC+Op
         Zdh2Zj8IFeyJq2P5ctHgL7CpeXtFjGnFkJaE40Ch061WHFR3xTWhvG1JFxiwa0h/Aamj
         8VEyLjw8UGhZxyDkVP7r+9MItAyygxJ98mJOJp+L1FhyRAZEwm5b4TYaJcRRtZTn2zhO
         ZheA==
X-Forwarded-Encrypted: i=1; AKwUvBym0nJsB7K+70Safp272rciq6js/Sqz7mN3vvia6XGZNnS3k7mo9j0KUrSijxYHNbJ4jKNHgBH40A3D@vger.kernel.org
X-Gm-Message-State: AFq9FYIFJVEAUDfahArDvSoBxc0r3FPxCUokEpJPCkEVb8KtBQESWo05
	ZgyYwv/Cgk4v2ZCWbI3C/oXZVJqiF2p3AFpHSqNFooecgk8IdB0nCUBZ8vRngY61ZkA=
X-Gm-Gg: AYBFou0CZJKaHNx2N6uQJq3MckVLPBQYUPQzer7umbHGz1j06G1Cu3DmdXDMhu4ApoS
	tTPOLtoxZuGbZW0kei/HcPhu6x0Tq/2RpdVIXeIVhkYxVkdRYLf9mhJ5eiI/NthSvPUl/2mKHwK
	bSYdGXoFRQabCYmyta3WsJrv+XPM7VTul3LuYMunv31P2/TzZjTP1twjti0itOiqusy6Q5QcTga
	oci8OFT8ECgT/sqVzcfYkkKWJgDjdXyX4oW22pXg0pU9DjxbhH9/rsJ2ZOvdZZZKKORl3HJgsfp
	BdIITiJ8fgN1EZB0ofCpjsuKVqY9ZvWIy7Z70I8rdzMFyQJzUD9HWhfHBeMHsNb5WUvVQFSkJjy
	4C9KL35ArI1LX7WgowXjQckcMjjl/mcIrEiN3Rv+pIn3Y9qrUrHFv15Qfkfb4fCq2ooUiHx7o4f
	dVIGLRZfzLsPrLoemEstQkP41w+T6RA1e7kpIy7cN0z/i0hIAIUwz4hrYZY6CNzrVrHCoSbjAfm
	8+bjjgnGY/GLuWErWSHAaa9DZAUeou6NkSzyqUxE/bxA/aOLfxaXMvOTWMJVFaJ5G/2ZeNyF+fQ
	Wr+L+lcM7yRw07YWGBcOXDSRZYQZ9nIFLrA7KM/RoXqHQLxDOO4=
X-Received: by 2002:a05:701b:4515:20b0:166:5552:780a with SMTP id a92af1059eb24-1ac5b028b11mr7948547c88.8.1793473824427;
        Sat, 31 Oct 2026 12:10:24 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1b38ac58sm17384804c88.23.2026.10.31.12.10.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 12:10:23 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Oct 2026 12:10:22 -0700
Message-Id: <DMJ9ERWOMF5G.3KVDIP2QE3A7J@nexthop.ai>
Cc: "Richard Cheng" <icheng@nvidia.com>, "Andrew Lunn" <andrew@lunn.ch>,
 "Rob Herring" <robh@kernel.org>, "Saravana Kannan" <saravanak@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Charles Keepax" <ckeepax@opensource.cirrus.com>,
 "Richard Fitzgerald" <rf@opensource.cirrus.com>, "David Rhodes"
 <david.rhodes@cirrus.com>, "Linus Walleij" <linusw@kernel.org>, "Andy
 Shevchenko" <andriy.shevchenko@linux.intel.com>, "Daniel Scally"
 <djrscally@gmail.com>, "Heikki Krogerus" <heikki.krogerus@linux.intel.com>,
 "Sakari Ailus" <sakari.ailus@linux.intel.com>, "Bartosz Golaszewski"
 <brgl@kernel.org>, "Len Brown" <lenb@kernel.org>, "Davidlohr Bueso"
 <dave@stgolabs.net>, "Jonathan Cameron" <jic23@kernel.org>, "Dave Jiang"
 <dave.jiang@intel.com>, "Alison Schofield" <alison.schofield@intel.com>,
 "Vishal Verma" <vishal.l.verma@intel.com>, "Dan Williams"
 <djbw@kernel.org>, "Ira Weiny" <iweiny@kernel.org>, "Li Ming"
 <ming.li@zohomail.com>, "Lizhi Hou" <lizhi.hou@amd.com>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-pci@vger.kernel.org>, <linux-sound@vger.kernel.org>,
 <patches@opensource.cirrus.com>, <linux-gpio@vger.kernel.org>,
 <linux-acpi@vger.kernel.org>, <linux-cxl@vger.kernel.org>, "Allan Nielsen"
 <allan.nielsen@microchip.com>, "Horatiu Vultur"
 <horatiu.vultur@microchip.com>, "Daniel Machon"
 <daniel.machon@microchip.com>, "Steen Hegelund"
 <steen.hegelund@microchip.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v13 00/10] lan966x pci device: Add support for SFPs, PCI
 part
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Herve Codina" <herve.codina@bootlin.com>
In-Reply-To: <20261012142826.159178-1-herve.codina@bootlin.com>
References: <20261012142826.159178-1-herve.codina@bootlin.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Herve,

On Mon, Oct 12, 2026 at 04:28:14PM +0200, Herve Codina wrote:
> Patches 8 and 9 fix fw_devlink issues specific to PCI and the
> device-tree nodes created during enumeration.

We hit exactly this on x86 switch platforms with
CONFIG_PCI_DYNAMIC_OF_NODES. A driver applies a device-tree overlay
onto each Xilinx FPGA PCI endpoint and populates I2C controllers
(xiic), watchdogs and GPIO blocks. Their interrupts go through small
chained irqchips that are themselves fed by the FPGA's MSI vectors.

Without this series, fw_devlink drops every supplier link under the
synthesized PCI root bridge node ("Not linking ... might never become
dev"), so the irqchips end up with no consumers. Unbinding one of them
frees IRQ descriptors that the I2C controllers and the watchdog still
hold. We get a remove_proc_entry "removing non-empty directory 'irq/N'"
WARNING per IRQ, and the I2C controllers are dead until reboot.

With the series applied on v7.3, the device links are created (up to
32 consumers per irqchip), and unbinding an irqchip now unbinds its
consumers first. I tested on two platforms, with 2 and 3 FPGAs (4 and
7 irqchips). Repeated unload/reload of the irqchip driver was clean
every time, and everything probed again afterwards.

Tested-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Thanks,
Abdurrahman
