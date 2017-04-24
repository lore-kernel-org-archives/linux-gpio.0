From: David Laight <David.Laight@ACULAB.COM>
Subject: RE: [PATCH 8/8] selftests: x86: override clean in lib.mk to fix
 warnings
Date: Mon, 24 Apr 2017 15:57:34 +0000
Message-ID: <063D6719AE5E284EB5DD2968C1650D6DCFFD9941@AcuExch.aculab.com>
References: <cover.1492815938.git.shuahkh@osg.samsung.com>
 <31b94c5cb9a8f71fd3888b648f32c0bd91e4a9bd.1492815938.git.shuahkh@osg.samsung.com>
 <87o9vpyp6h.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87o9vpyp6h.fsf@concordia.ellerman.id.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: 'Michael Ellerman' <mpe@ellerman.id.au>, "shuah@kernel.org" <shuah@kernel.org>, "bamvor.zhangjian@linaro.org" <bamvor.zhangjian@linaro.org>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "paulus@samba.org" <paulus@samba.org>, "dvhart@infradead.org" <dvhart@infradead.org>
Cc: "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "rkrcmar@redhat.com" <rkrcmar@redhat.com>, "dsafonov@virtuozzo.com" <dsafonov@virtuozzo.com>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, Shuah Khan <shuahkh@osg.samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "emilio.lopez@collabora.co.uk" <emilio.lopez@collabora.co.uk>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "luto@kernel.org" <luto@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "mingo@kernel.org" <mingo@kernel.org>
List-Id: linux-gpio@vger.kernel.org

From: Linuxppc-dev Michael Ellerman
> Shuah Khan <shuahkh@osg.samsung.com> writes:
> 
> > Add override for lib.mk clean to fix the following warnings from clean
> > target run.
> >
> > Makefile:44: warning: overriding recipe for target 'clean'
> > ../lib.mk:55: warning: ignoring old recipe for target 'clean'
> >
> > Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
> > ---
> >  tools/testing/selftests/x86/Makefile | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/tools/testing/selftests/x86/Makefile b/tools/testing/selftests/x86/Makefile
> > index 38e0a9c..4d27550 100644
> > --- a/tools/testing/selftests/x86/Makefile
> > +++ b/tools/testing/selftests/x86/Makefile
> > @@ -40,8 +40,9 @@ all_32: $(BINARIES_32)
> >
> >  all_64: $(BINARIES_64)
> >
> > -clean:
> > +override define CLEAN
> >  	$(RM) $(BINARIES_32) $(BINARIES_64)
> > +endef
> 
> Simpler as:
> 
> EXTRA_CLEAN := $(BINARIES_32) $(BINARIES_64)

Actually for builds that insist on crapping all over the source tree I've used:

clean:
	rm -rf `cat .cvsignore 2>/dev/null`

	David
