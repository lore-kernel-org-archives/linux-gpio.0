From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] selftests: Fix test errors related to lib.mk khdr target
Date: Fri, 14 Dec 2018 00:40:59 +0100
Message-ID: <f4dddfa8-1493-5fd5-58a9-ea6ff2b25f9c@redhat.com>
References: <20181213200011.10779-1-shuah@kernel.org>
 <623cdf7b-fc3c-2a93-c61a-a043e3d7f75b@redhat.com>
 <25593aa4-a2a7-6567-11f2-b702b6e5563c@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <25593aa4-a2a7-6567-11f2-b702b6e5563c@kernel.org>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: shuah <shuah@kernel.org>, tglx@linutronix.de, mingo@redhat.com, peterz@infradead.org, dvhart@infradead.org, bamv2005@gmail.com, brgl@bgdev.pl, fathi.boudra@linaro.org, anders.roxell@linaro.org, daniel.diaz@linaro.org, pintu.ping@gmail.com, drjones@redhat.com, hofsass@google.com, peterx@redhat.com, peng.hao2@zte.com.cn, wei@redhat.com, davem@davemloft.net, dcaratti@redhat.com, akpm@linux-foundation.org, mhocko@suse.com, khalid.aziz@oracle.com, mpe@ellerman.id.au, aneesh.kumar@linux.vnet.ibm.com, dima@arista.com
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 13/12/18 23:50, shuah wrote:
>>
>> Looks good.  Could you please provide a topic branch so that we can
>> avoid conflicts between our trees at the next merge window.
>>
> 
> Thanks. The topic branch is
> 
> git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
> 
> I will apply it in a day or two to get ready for the merge window.

There are already other patches in that branch; a topic branch only
includes this one on top of Linus's tree, so that it is independent from
other changes being made in both your and my tree.

You should create a new branch in linux-kselftest.git, pull it into
next, and tell me the name so that I can pull the same branch into kvm.git.

Thanks,

Paolo
