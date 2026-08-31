Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EECB4A1DEB
	for <linux-gpio@vger.kernel.org>; Mon, 31 Aug 2026 14:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186759; cv=none; b=Vtlp7eWgnNVp0yrnLXReKG2tSQzA+yq65FmnEes80Rhcall8KvhlwqErkS65N71Rka67ejkdlEyqg2xOsKc8N27e6Tx9She94I6pYBKrOpLIJzss/SwPGNDZtA88v/mp2sO0+kCNxG1jmncAvFW+y7cgurYSrfT66huCkeixTAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186759; c=relaxed/simple;
	bh=sfikze6+gZ+EsCWAIYm+ZSac24RursuN4Dou+8L9PbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cIQTcojb/ztfi4qKuupcCElvrUAGoJRdVWKGLt/dI6h7IJAzhclrc+rJkiMn6U1bJFqXaGhpPwgCri2RCTRmytJtJhPU2OmykuVqI8659/6vud/4g4QMc4+wnQ6rWhfSEP7sv/BeniIIFddN0rNf3tmtfYO4IoOBFin1L9EWCT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jq/IZcF3; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jq/IZcF3"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49954b88fffso24610755e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 31 Aug 2026 07:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788186757; x=1788791557; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1zuj9/JVZ1cDk7VZA+4erdxKCKl7cu9pGDcl0kl4ePs=;
        b=Jq/IZcF3R08hI+MwFgCrYpkcIOPhbeXbwseqGCz2fytVFqmai9Ei7ARh2eOC/r3mMp
         qosaltlmmXsGTP9Pq5TtptZev+EvwOGDx71X3SA+BvNwwGU27v+PxTKJGSmYQyWUnRkp
         nHHnbEaH+017xc8Og11BhE+tyoc2ZZSIArAUkbUnRgBftL/N1OiOLQSc0bTP/Cj/Veqi
         sCmEl9bhQXM8Udy/F6h2wDmAno67TSWHhrDBFWZPHx70TiKRlr84ax6XIAsYbybvlBeX
         PBv0VeZ00EnmDCoH48fuXpiMMPMuhdCKYgz1Mfs99j8CXCuEPbOthnpjfEtxbIWS6jbn
         W/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788186757; x=1788791557;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1zuj9/JVZ1cDk7VZA+4erdxKCKl7cu9pGDcl0kl4ePs=;
        b=M0bzLYOktF79LQJ+WV1fn0KhF2zw23QmgLpGf1ZITGRRSMD7JxEMMQLqbeZ2iNjiym
         oT2mwjyFSFZposIygYjaMoMgyNLgG4+WeG02I4JC/nUBo77D7v79Fn4D0gBja1a36yLI
         p6TYjl4rGJ4ItFhIgIis8FGDQAdOQ7X30hbUe5Y8ivsEBYtCtlyvCrkJUWqZ5j69gP9+
         GarAYv/qMajM7534ozGoFS0jPiXZXZceqoQy9Y+QmY7n+c4Hmk9kHjInpQJge2g40NW4
         NnWzDD1qiRNpFUxx3mSK0k0L1e7F1YlJvW+7qSt7cnHEGhmLeKtUgN9ugewRKaM6q6Kg
         a9JQ==
X-Forwarded-Encrypted: i=1; AHgh+RqMrFhhUMVdqVyqtoK0/F1IrXAVVgZ8iKRT3FEEPW5VVtILehP0g/r5xixTXdRYNmlIpPGIdrghwWmH@vger.kernel.org
X-Gm-Message-State: AFuF++m7HQZbesRNL+Ra7rka//iaicX+nQ+Kmn2kWeWGP6caKapFHwJn
	jFVS1/oYs7jDZAtRh//zxQ29rQNn3aBNdWwtLm2CaTmN9w+4bKJsdITp3Em0JRrwu5o=
X-Gm-Gg: AR+sD11F8tfyJMJRo8zemSAebZXIynHgoAwKGAiAXuWNn6RVWlB94ekxR77Eo4JZIwp
	ws8KkJMHPzsbdrJl5MD1d7AO+XaApdjoxHHjikK9K9bbzHQSumWwQw1NOCgziAacbP1+Q0nKmOt
	069YcsIJufbQZqjAeEkFXLE3onBS7lz08/lmuMXXR2qJ96h0h9vcOAfQLhzRFmrL5pa8197P67i
	jVyB1mflAmyMQS9LQO91Q9M3vqbDZr4uq6v0LirAW2TTW/6BN/EAeafGY2XK6BYBdHNqHP1uWOr
	s7//ReeUet+GGBu8llU+oBE2qucjzUemqEmqTVAbBv23kVoOHYePRuvVWsU4yrqvz+z3SvBJw3G
	w0KrMGo44DUSiGINSzRXsdxBsAN95lFtrXVG9jm1yMnQxd04HoVAw+7BkDGIOEL8qhRM0N7KO2S
	K5PiMLbQJJYDlG4ZJtIUnTfLDAkIL2FYdif9fpApLF5Lvx4uF0c9G/7CHIglr5SRDOujUGQYmPB
	lBgqVVdL4V6y7W1AqKUdrdW
X-Received: by 2002:a05:600c:3549:b0:49b:5521:785d with SMTP id 5b1f17b1804b1-49b91c1e9d8mr389591765e9.4.1788186756314;
        Mon, 31 Aug 2026 07:32:36 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b945816f2sm344786125e9.8.2026.08.31.07.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:32:35 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Jason Wang <jasowangio@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Subject: [PATCH 5/7] docs: vduse: align documentation with current uapi and driver
Date: Mon, 31 Aug 2026 11:31:23 -0300
Message-ID: <20260831143125.151360-6-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831143125.151360-1-ivanrwcm25@gmail.com>
References: <20260831143125.151360-1-ivanrwcm25@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update supported device IDs (block, net, fs), all six read/write message
types, the VDUSE_VQ_INJECT_IRQ ioctl name, and VQ_SETUP group vs asid
usage per include/uapi/linux/vduse.h.

Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 Documentation/userspace-api/vduse.rst | 33 +++++++++++++++++----------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/Documentation/userspace-api/vduse.rst b/Documentation/userspace-api/vduse.rst
index 81479d47c8b9..d316857ca5bd 100644
--- a/Documentation/userspace-api/vduse.rst
+++ b/Documentation/userspace-api/vduse.rst
@@ -11,11 +11,10 @@ to make the device emulation more secure, the emulated vDPA device's
 control path is handled in the kernel and only the data path is
 implemented in the userspace.
 
-Note that only virtio block device is supported by VDUSE framework now,
-which can reduce security risks when the userspace process that implements
-the data path is run by an unprivileged user. The support for other device
-types can be added after the security issue of corresponding device driver
-is clarified or fixed in the future.
+Note that virtio block, network, and filesystem device types are supported
+by the VDUSE framework. Other device types may be added after the security
+implications of the corresponding device driver are clarified or fixed in
+the future.
 
 Create/Destroy VDUSE devices
 ----------------------------
@@ -135,7 +134,8 @@ module as follows:
 		return 0;
 	}
 
-There are now three types of messages introduced by VDUSE framework:
+The following control message types may be delivered via read(2) on
+/dev/vduse/$NAME:
 
 - VDUSE_GET_VQ_STATE: Get the state for virtqueue, userspace should return
   avail index for split virtqueue or the device/driver ring wrap counters and
@@ -151,6 +151,15 @@ There are now three types of messages introduced by VDUSE framework:
   IOVA range, userspace should firstly remove the old mapping, then setup the new
   mapping via the VDUSE_IOTLB_GET_FD ioctl.
 
+- VDUSE_SET_VQ_GROUP_ASID: Notify userspace to change the address space of a
+  virtqueue group (API version 1).
+
+- VDUSE_SET_VQ_READY: Notify userspace that a virtqueue should become ready or
+  not ready (when VDUSE_F_QUEUE_READY is negotiated).
+
+- VDUSE_SUSPEND: Notify userspace that the device is being suspended (when
+  VDUSE_F_SUSPEND is negotiated).
+
 After DRIVER_OK status bit is set via the VDUSE_SET_STATUS message, userspace is
 able to start the dataplane processing as follows:
 
@@ -227,7 +236,7 @@ able to start the dataplane processing as follows:
    described by the descriptors in the descriptor table should be also mapped into
    userspace via the VDUSE_IOTLB_GET_FD ioctl before accessing.
 
-5. Inject an interrupt for specific virtqueue with the VDUSE_INJECT_VQ_IRQ ioctl
+5. Inject an interrupt for specific virtqueue with the VDUSE_VQ_INJECT_IRQ ioctl
    after the used ring is filled.
 
 Enabling ASID (API version 1)
@@ -238,11 +247,11 @@ version 1. Set it up with ioctl(VDUSE_SET_API_VERSION) on `/dev/vduse/control`
 and pass `VDUSE_API_VERSION_1` before creating a new VDUSE instance with
 ioctl(VDUSE_CREATE_DEV).
 
-Afterwards, you can use the member asid of ioctl(VDUSE_VQ_SETUP) argument to
-select the address space of the IOTLB you are querying.  The driver could
-change the address space of any virtqueue group by using the
-VDUSE_SET_VQ_GROUP_ASID VDUSE message type, and the VDUSE instance needs to
-reply with VDUSE_REQ_RESULT_OK if it was possible to change it.
+Afterwards, ioctl(VDUSE_VQ_SETUP) takes a virtqueue group index in
+struct vduse_vq_config::group.  The driver can change the address space
+of any virtqueue group by using the VDUSE_SET_VQ_GROUP_ASID message type,
+and the VDUSE instance needs to reply with VDUSE_REQ_RESULT_OK if it was
+possible to change it.
 
 Similarly, you can use ioctl(VDUSE_IOTLB_GET_FD2) to obtain the file descriptor
 describing an IOVA region of a specific ASID. Example usage:
-- 
2.43.0

